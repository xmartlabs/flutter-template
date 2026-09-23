#!/usr/bin/env python3
"""Fetch and enrich outdated-dependency data for one manifest directory.

Runs the ecosystem's outdated-versions check, then for every outdated
package: queries the registry, batch-queries security advisories, and
fetches+trims the changelog to the current->target version range. Computes
`urgency`, a provisional `risk`, and `tier` deterministically from the
report-schema.md rubric. Prints one JSON array to stdout. Writes nothing to
disk and mutates nothing in the repo -- read-only, matching dependency-audit's
own constraint.

Usage:
    fetch_updates.py --config <ecosystems/<name>.json> --manifest-dir <dir>

Exit codes:
    0  success (individual package fetch failures are soft -- see
       "fetch_error" on that record, the run still exits 0)
    1  the outdated-versions check itself failed or produced unparseable
       output -- nothing to enrich, no partial output printed
    2  bad arguments / config file problems
"""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
import urllib.error
import urllib.request
from pathlib import Path
from typing import Any

HTTP_TIMEOUT = 10
HTTP_RETRIES = 1
CHANGELOG_EXCERPT_MAX_CHARS = 4000
CHANGELOG_EXCERPT_MAX_LINES = 200

URGENCY_ORDER = ["maintenance", "low", "medium", "high", "critical"]


def eprint(*args: Any) -> None:
    print(*args, file=sys.stderr)


def load_config(path: Path) -> dict:
    try:
        return json.loads(path.read_text())
    except (OSError, json.JSONDecodeError) as e:
        eprint(f"fetch_updates: could not read/parse config {path}: {e}")
        sys.exit(2)


def run_outdated_cmd(cmd: list[str], cwd: Path) -> dict:
    try:
        proc = subprocess.run(
            cmd, cwd=cwd, capture_output=True, text=True, timeout=180
        )
    except (OSError, subprocess.TimeoutExpired) as e:
        eprint(f"fetch_updates: outdated_cmd failed to run: {e}")
        sys.exit(1)

    stdout = proc.stdout
    # Some tools (e.g. `flutter pub outdated`) prefix JSON output with a
    # non-JSON banner ("A new version of Flutter is available!"). Skip to
    # the first '{' rather than trusting stdout is pure JSON.
    brace_idx = stdout.find("{")
    if brace_idx == -1:
        eprint(
            "fetch_updates: outdated_cmd produced no JSON object on stdout "
            f"(exit {proc.returncode}). stderr:\n{proc.stderr}"
        )
        sys.exit(1)

    json_text = stdout[brace_idx:]
    try:
        return json.loads(json_text)
    except json.JSONDecodeError as e:
        eprint(f"fetch_updates: outdated_cmd output was not valid JSON: {e}")
        eprint(f"raw stdout after banner-strip:\n{json_text[:2000]}")
        sys.exit(1)


def strip_build_suffix(version: str, pattern: str) -> str:
    return re.sub(pattern, "", version)


def parse_version_tuple(version: str, suffix_pattern: str) -> tuple[int, ...]:
    stripped = strip_build_suffix(version, suffix_pattern)
    stripped = re.split(r"[-+]", stripped)[0]  # drop prerelease tag too
    parts = []
    for p in stripped.split("."):
        m = re.match(r"\d+", p)
        parts.append(int(m.group()) if m else 0)
    while len(parts) < 3:
        parts.append(0)
    return tuple(parts[:3])


def classify_bump(current: str, target: str, suffix_pattern: str) -> str:
    if not current or not target:
        return "prerelease"
    if "-" in strip_build_suffix(target, suffix_pattern):
        return "prerelease"
    c = parse_version_tuple(current, suffix_pattern)
    t = parse_version_tuple(target, suffix_pattern)
    if c == t:
        return "none"
    if c[0] != t[0]:
        return "major"
    if c[1] != t[1]:
        return "minor"
    return "patch"


def provisional_risk(bump: str) -> str:
    return {"none": "none", "patch": "none", "minor": "low", "major": "medium"}.get(
        bump, "medium"
    )


def tier_from_risk(risk: str) -> str:
    if risk in ("none", "low"):
        return "safe"
    if risk == "medium":
        return "review"
    return "breaking"


def urgency_from_advisories(advisories: list[dict]) -> str:
    if not advisories:
        return "maintenance"
    worst = "low"
    for adv in advisories:
        cvss = adv.get("cvss")
        if cvss is None:
            level = "low"
        elif cvss >= 9.0:
            level = "critical"
        elif cvss >= 7.0:
            level = "high"
        elif cvss >= 4.0:
            level = "medium"
        else:
            level = "low"
        if URGENCY_ORDER.index(level) > URGENCY_ORDER.index(worst):
            worst = level
    return worst


def http_json(
    url: str, method: str = "GET", body: dict | None = None
) -> tuple[Any | None, str | None]:
    """Returns (parsed_json, error_message). Exactly one is None."""
    data = json.dumps(body).encode() if body is not None else None
    headers = {"Content-Type": "application/json"} if body is not None else {}
    req = urllib.request.Request(url, data=data, headers=headers, method=method)

    last_err = None
    for attempt in range(HTTP_RETRIES + 1):
        try:
            with urllib.request.urlopen(req, timeout=HTTP_TIMEOUT) as resp:
                if resp.status >= 300:
                    last_err = f"HTTP {resp.status} from {url}"
                    continue
                return json.loads(resp.read().decode()), None
        except urllib.error.HTTPError as e:
            last_err = f"HTTP {e.code} from {url}"
        except (urllib.error.URLError, TimeoutError, json.JSONDecodeError) as e:
            last_err = f"{type(e).__name__}: {e}"
    return None, last_err


DEPENDENCY_SECTION_HEADERS = ("dependencies:", "dev_dependencies:")


def dependency_section_lines(text: str) -> list[str]:
    """Only lines inside a top-level dependencies:/dev_dependencies: block --
    keeps version matching from colliding with unrelated top-level sections
    that happen to mention the same key (e.g. environment: also has a
    `flutter:` line, unrelated to the `flutter:` sdk dependency entry)."""
    lines = text.splitlines()
    out: list[str] = []
    in_section = False
    for line in lines:
        if line.rstrip("\n") in DEPENDENCY_SECTION_HEADERS:
            in_section = True
            continue
        if in_section:
            if line and not line[0].isspace():
                in_section = False  # next top-level key
                continue
            out.append(line)
    return out


def manifest_fallback_version(
    manifest_path: Path, package: str, pattern_template: str
) -> str | None:
    try:
        text = manifest_path.read_text()
    except OSError:
        return None
    pattern = pattern_template.replace("{name}", re.escape(package))
    for line in dependency_section_lines(text):
        m = re.match(pattern, line)
        if m:
            return m.group(1)
    return None


def fetch_registry(url_template: str, package: str) -> tuple[dict | None, str | None]:
    url = url_template.replace("{name}", package)
    return http_json(url)


def fetch_advisories_batch(
    batch_url: str, ecosystem_name: str, packages: list[tuple[str, str]]
) -> tuple[list[list[dict]], str | None]:
    """packages: list of (name, version). Returns per-package raw OSV id lists."""
    queries = [
        {"package": {"name": name, "ecosystem": ecosystem_name}, "version": version}
        for name, version in packages
    ]
    result, err = http_json(batch_url, method="POST", body={"queries": queries})
    if err:
        return [[] for _ in packages], err
    return result.get("results", [[] for _ in packages]), None


def fetch_advisory_detail(detail_url_template: str, vuln_id: str) -> dict | None:
    url = detail_url_template.replace("{id}", vuln_id)
    data, err = http_json(url)
    if err or not data:
        return None
    # Best-effort CVSS extraction; OSV doesn't always expose a numeric score
    # uniformly across ecosystems. Fall back to None (treated as "low").
    cvss = None
    for sev in data.get("severity", []):
        score = sev.get("score", "")
        m = re.search(r"(\d+\.\d+)$", score)
        if m:
            cvss = float(m.group(1))
            break
    return {
        "id": vuln_id,
        "cvss": cvss,
        "summary": data.get("summary", "")[:300],
    }


def fetch_changelog_excerpt(
    url_template: str,
    version_header_regex: str,
    package: str,
    current: str,
    target: str,
) -> tuple[str, str | None]:
    """Matches version headers against the RAW fetched content (HTML, for a
    site like pub.dev that renders the changelog rather than serving raw
    markdown) so the config's version_header_regex can target real markup.
    Tags are stripped only when building the excerpt text itself."""
    url = url_template.replace("{name}", package)
    req = urllib.request.Request(url, headers={"User-Agent": "dependency-audit-fetch/1"})
    try:
        with urllib.request.urlopen(req, timeout=HTTP_TIMEOUT) as resp:
            if resp.status >= 300:
                return "", f"HTTP {resp.status} fetching changelog"
            raw = resp.read().decode(errors="replace")
    except (urllib.error.URLError, TimeoutError) as e:
        return "", f"{type(e).__name__} fetching changelog: {e}"

    header_re = re.compile(
        version_header_regex.replace("{version}", r"(\d[\w.+-]*)")
    )
    versions_seen = [
        (m.start(), m.group(1)) for m in header_re.finditer(raw)
    ]

    if not versions_seen:
        return "", "could not parse changelog headers, see changelog_url"

    if target not in {ver for _, ver in versions_seen}:
        # A real, legitimate case (not a parsing failure): not every
        # published version gets its own changelog entry. Report this
        # honestly rather than silently substituting an unrelated range
        # (e.g. falling back to "most recent" would pull in changes from
        # versions well past the actual proposed target).
        return (
            "",
            f"changelog has no entry for target version {target} "
            "(package may have republished without release notes for it) "
            "-- see changelog_url",
        )

    start_pos = None
    end_pos = len(raw)
    for pos, ver in versions_seen:
        if ver == target and start_pos is None:
            start_pos = pos
        if ver == current:
            end_pos = pos
            break

    raw_slice = raw[start_pos:end_pos]
    text = re.sub(r"<[^>]+>", "\n", raw_slice)
    lines = [l.strip() for l in text.splitlines() if l.strip()]
    excerpt = "\n".join(lines[:CHANGELOG_EXCERPT_MAX_LINES])[:CHANGELOG_EXCERPT_MAX_CHARS]
    if not excerpt.strip():
        return "", "could not parse changelog headers, see changelog_url"
    return excerpt, None


def version_of(entry: dict, key: str) -> str | None:
    """`pub outdated --json` nests each version as {"version": "x.y.z"} or
    omits the key/uses null entirely when unknown."""
    val = entry.get(key)
    if not val:
        return None
    return val.get("version")


def process_package(
    entry: dict, config: dict, manifest_dir: Path, manifest_rel_path: str
) -> dict:
    name = entry["package"]
    current = version_of(entry, "current")
    upgradable_raw = version_of(entry, "upgradable")
    latest_compatible = version_of(entry, "resolvable") or upgradable_raw
    latest = version_of(entry, "latest")
    current_source = "lockfile"

    if current is None:
        pattern = config.get("manifest_version_pattern")
        if pattern:
            manifest_path = manifest_dir / "pubspec.yaml"
            fallback = manifest_fallback_version(manifest_path, name, pattern)
            if fallback:
                current = fallback
                current_source = "manifest_fallback"

    suffix_pattern = config.get("strip_build_suffix_regex", r"\+\d+$")
    target = latest_compatible or latest or current
    bump = classify_bump(current or "", target or "", suffix_pattern)

    # Only report `upgradable` when it adds information: a zero-edit bump
    # that's neither "nothing available" (== current) nor "same as the
    # editable target anyway" (== latest_compatible).
    upgradable = None
    if upgradable_raw and upgradable_raw not in (current, latest_compatible):
        upgradable = upgradable_raw

    record: dict[str, Any] = {
        "ecosystem": config["ecosystem"],
        "kind": "package",
        "package": name,
        "manifest": manifest_rel_path,
        "current": current,
        "current_source": current_source,
        "upgradable": upgradable,
        "latest_compatible": latest_compatible,
        "latest": latest,
        "bump": bump,
        "urgency": "maintenance",
        "advisories": [],
        "risk": provisional_risk(bump),
        "changelog_url": config["changelog"]["url_template"].replace("{name}", name),
        "breaking_changes": [],
        "affected_call_sites": [],
        "verdict": None,
        "evidence": None,
        "tier": None,
        "changelog_excerpt": "",
    }

    if current is None:
        record["fetch_error"] = "no current version available from lockfile or manifest fallback"
        record["tier"] = tier_from_risk(record["risk"])
        return record

    if bump == "none":
        # Already current (common without a lockfile, where the outdated
        # check can't distinguish "current" from "every declared dep" and
        # lists everything) -- nothing to enrich, skip the network calls.
        record["tier"] = tier_from_risk(record["risk"])
        return record

    reg_data, reg_err = fetch_registry(config["registry_api"]["url_template"], name)
    fetch_errors = []
    if reg_err:
        fetch_errors.append(f"registry: {reg_err}")

    excerpt, changelog_err = fetch_changelog_excerpt(
        config["changelog"]["url_template"],
        config["changelog"]["version_header_regex"],
        name,
        current,
        target,
    )
    record["changelog_excerpt"] = excerpt
    if changelog_err:
        fetch_errors.append(f"changelog: {changelog_err}")

    if fetch_errors:
        record["fetch_error"] = "; ".join(fetch_errors)

    record["tier"] = tier_from_risk(record["risk"])
    return record


def enrich_advisories(records: list[dict], config: dict) -> None:
    advisory_cfg = config.get("advisory_source")
    if not advisory_cfg:
        return
    candidates = [(r["package"], r["current"]) for r in records if r.get("current")]
    if not candidates:
        return

    results, err = fetch_advisories_batch(
        advisory_cfg["batch_url"], advisory_cfg["ecosystem_name"], candidates
    )
    if err:
        for r in records:
            if r.get("current"):
                existing = r.get("fetch_error", "")
                r["fetch_error"] = (existing + "; " if existing else "") + f"advisories: {err}"
        return

    idx = 0
    for r in records:
        if not r.get("current"):
            continue
        hits = results[idx] if idx < len(results) else {}
        idx += 1
        vuln_ids = [v.get("id") for v in hits.get("vulns", []) if v.get("id")]
        advisories = []
        for vuln_id in vuln_ids:
            detail = fetch_advisory_detail(advisory_cfg["detail_url_template"], vuln_id)
            if detail:
                advisories.append(detail)
        r["advisories"] = advisories
        r["urgency"] = urgency_from_advisories(advisories)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--config", required=True, type=Path)
    parser.add_argument("--manifest-dir", required=True, type=Path)
    args = parser.parse_args()

    config = load_config(args.config)
    manifest_dir = args.manifest_dir.resolve()
    if not manifest_dir.is_dir():
        eprint(f"fetch_updates: manifest-dir does not exist: {manifest_dir}")
        sys.exit(2)

    outdated = run_outdated_cmd(config["outdated_cmd"], manifest_dir)
    sdk_placeholder = config.get("sdk_placeholder_version")
    # Only direct/dev dependencies are manifest-editable audit candidates --
    # transitive-only entries aren't declared in the manifest at all. SDK-
    # constrained pseudo-packages (e.g. Dart/Flutter's `flutter`/`flutter_test`
    # sdk: deps) report a sentinel version and have no real version to audit --
    # toolchain-audit owns the actual SDK version, not this skill.
    packages = [
        p
        for p in outdated.get("packages", [])
        if p.get("kind") in ("direct", "dev")
        and (sdk_placeholder is None or version_of(p, "latest") != sdk_placeholder)
    ]

    try:
        manifest_rel_path = str(
            (manifest_dir / "pubspec.yaml").relative_to(Path.cwd())
        )
    except ValueError:
        manifest_rel_path = str(manifest_dir / "pubspec.yaml")

    all_records = [
        process_package(entry, config, manifest_dir, manifest_rel_path)
        for entry in packages
    ]
    # Only genuinely outdated packages are real audit candidates -- drop
    # already-current entries (bump == "none") rather than reporting a
    # no-op "update" for every declared dependency.
    records = [r for r in all_records if r["bump"] != "none"]
    enrich_advisories(records, config)

    print(json.dumps(records, indent=2))


if __name__ == "__main__":
    main()
