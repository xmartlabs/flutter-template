#!/usr/bin/env python3
"""Precisely bump one dependency's version in a pubspec.yaml-style manifest.

A surgical single-line edit, not a YAML parse/re-serialize -- avoids
reformatting comments/spacing/quoting elsewhere in the file that have
nothing to do with this bump. Refuses to guess: requires exactly one
matching, plain-version dependency line, and skips (hard-fails on) map-style
declarations (sdk:/path:/git:) since those aren't plain-version bumps.

Used by both dependency-update-apply (the real bump, for commit) and
dependency-update-audit (the scratch-branch bump, for verification) so both
stages apply a bump identically.

Usage:
    bump_manifest.py --manifest <path> --package <name> --version <target>
                      [--pin-style preserve|exact]

    --pin-style preserve (default): keep whatever prefix (none, ^, ~, ...)
        and quoting style the line already has, replace only the version
        digits. This is what guarantees a bump never silently introduces or
        removes a `^` the line didn't already have.
    --pin-style exact: strip any range prefix, write the bare target
        version. Only for a caller that explicitly wants to normalize to an
        exact pin regardless of the file's current style.

Exit codes:
    0  success -- prints "OLD LINE -> NEW LINE" to stdout as evidence
    1  no match, ambiguous match, or a map-style dependency -- no edit made
    2  bad arguments / file not found
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

DEPENDENCY_SECTION_HEADERS = ("dependencies:", "dev_dependencies:")

# A plain-version dependency line, e.g. `  dio: ^5.11.1` or `  hive: "2.2.3"`.
# Captures: (1) everything before the version (indent, name, colon, spacing,
# quote, prefix), (2) the version token itself, (3) everything after.
LINE_PATTERN_TEMPLATE = (
    r'^(?P<prefix>[ \t]*{name}:[ \t]*["\']?[\^~]?)'
    r'(?P<version>[0-9][^\s"\'#]*)'
    r'(?P<suffix>["\']?.*)$'
)


def eprint(*args) -> None:
    print(*args, file=sys.stderr)


def find_dependency_section_line_numbers(lines: list[str]) -> set[int]:
    """Line indices that fall inside a top-level dependencies:/
    dev_dependencies: block -- keeps matching from colliding with an
    unrelated top-level section that happens to mention the same key
    (e.g. `environment:` also has a `flutter:` line)."""
    in_section = False
    result: set[int] = set()
    for i, line in enumerate(lines):
        stripped = line.rstrip("\n")
        if stripped in DEPENDENCY_SECTION_HEADERS:
            in_section = True
            continue
        if in_section:
            if line and not line[0].isspace():
                in_section = False
                continue
            result.add(i)
    return result


def find_map_style_declaration(lines: list[str], section_lines: set[int], package: str) -> bool:
    """True if `<package>:` appears as a map-style dependency (sdk:/path:/
    git: on the following indented line, nothing plain on its own line)."""
    header_re = re.compile(rf'^[ \t]*{re.escape(package)}:[ \t]*$')
    for i in section_lines:
        if header_re.match(lines[i]):
            return True
    return False


def bump(manifest_path: Path, package: str, target_version: str, pin_style: str) -> int:
    try:
        text = manifest_path.read_text()
    except OSError as e:
        eprint(f"bump_manifest: cannot read {manifest_path}: {e}")
        return 2

    lines = text.splitlines(keepends=True)
    section_lines = find_dependency_section_line_numbers(lines)

    if find_map_style_declaration(lines, section_lines, package):
        eprint(
            f"bump_manifest: '{package}' is a map-style dependency "
            "(sdk:/path:/git:) in this manifest -- not a plain-version bump, "
            "refusing to guess. Edit it manually if this is really intended."
        )
        return 1

    pattern = re.compile(LINE_PATTERN_TEMPLATE.format(name=re.escape(package)))
    matches = [
        (i, pattern.match(lines[i]))
        for i in section_lines
        if pattern.match(lines[i])
    ]

    if not matches:
        eprint(
            f"bump_manifest: no plain-version dependency line found for "
            f"'{package}' in {manifest_path} (checked dependencies:/"
            "dev_dependencies: sections only). No edit made."
        )
        return 1
    if len(matches) > 1:
        eprint(
            f"bump_manifest: '{package}' matched {len(matches)} lines in "
            f"{manifest_path} -- ambiguous, refusing to guess which one. "
            "No edit made."
        )
        return 1

    line_idx, m = matches[0]
    old_line = lines[line_idx].rstrip("\n")

    if pin_style == "exact":
        # Strip any range prefix (^ or ~) from the matched prefix group.
        new_prefix = re.sub(r'[\^~](?=["\']?$)', "", m.group("prefix"))
    else:
        new_prefix = m.group("prefix")

    newline = "\n" if lines[line_idx].endswith("\n") else ""
    new_line_content = f"{new_prefix}{target_version}{m.group('suffix')}"
    lines[line_idx] = new_line_content + newline

    manifest_path.write_text("".join(lines))

    print(f"{manifest_path}: {old_line.strip()} -> {new_line_content.strip()}")
    return 0


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", required=True, type=Path)
    parser.add_argument("--package", required=True)
    parser.add_argument("--version", required=True, dest="target_version")
    parser.add_argument("--pin-style", choices=["preserve", "exact"], default="preserve")
    args = parser.parse_args()

    if not args.manifest.is_file():
        eprint(f"bump_manifest: manifest not found: {args.manifest}")
        sys.exit(2)

    sys.exit(bump(args.manifest, args.package, args.target_version, args.pin_style))


if __name__ == "__main__":
    main()
