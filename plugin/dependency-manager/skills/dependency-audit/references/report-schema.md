# Candidate report schema

This is the shared data contract for the dependency-maintenance pipeline. Every
skill in the pipeline (`dependency-audit`, `toolchain-audit`,
`dependency-update-audit`, `dependency-update-apply`, `dependency-update-pr`)
reads and/or writes records in this shape. Don't restate this schema inline in
another skill — point back here.

Pipeline artifacts are written as JSON files under the session scratchpad
(never inside the repo): `candidates.json` (output of `dependency-audit` /
`toolchain-audit`) and `verdicts.json` (output of `dependency-update-audit`,
same records with the audit fields filled in).

## Candidate record

```jsonc
{
  // --- identity ---
  "ecosystem": "dart-flutter",          // matches an ecosystems/<name>.md adapter
  "kind": "package",                    // "package" | "toolchain"
  "package": "dio",                     // package name, or toolchain component (e.g. "flutter")
  "manifest": "pubspec.yaml",           // file this entry came from (repo-relative path)

  // --- versions ---
  "current": "5.4.3+1",
  "upgradable": null,                   // reachable with ZERO manifest edit (pub's "upgradable"); null/omit when it equals current or latest_compatible -- nothing extra to say
  "latest_compatible": "5.4.3+1",       // reachable by editing ONLY this package's own pin, every other constraint held fixed (pub's "resolvable")
  "latest": "5.9.0",                    // latest published version, ignoring constraints
  "bump": "minor",                      // "patch" | "minor" | "major" | "prerelease" -- classified against latest_compatible, see field rules

  // --- why update: urgency (security/deprecation-driven) ---
  "urgency": "medium",                  // "critical" | "high" | "medium" | "low" | "maintenance"
  "advisories": [                       // [] if none
    { "id": "GHSA-xxxx", "cvss": 7.5, "summary": "..." }
  ],

  // --- what it costs: risk (breaking-change-driven) ---
  "risk": "low",                        // "none" | "low" | "medium" | "high"
  "changelog_url": "https://pub.dev/packages/dio/changelog",
  "breaking_changes": ["..."],          // [] if none found
  "affected_call_sites": [              // [] until dependency-update-audit runs
    "lib/core/source/remote/http_service.dart:42"
  ],

  // --- filled in only by dependency-update-audit ---
  "verdict": null,                      // "safe" | "safe-with-refactor" | "needs-refactor" | "blocked" | null (not yet audited)
  "evidence": null,                     // { "checks": "pass"|"fail", "codegen_clean": true|false, "log": "..." } | null

  // --- derived from risk, drives PR grouping ---
  "tier": "safe"                        // "safe" | "review" | "breaking"
}
```

## Field rules

- **`urgency` and `risk` are independent axes.** A critical CVE fixed by a
  patch bump is `urgency: critical, risk: none` — urgent but cheap. Never
  collapse them into one scale.

  Urgency (why to update — security/deprecation only, ignores semver):
  - `critical` — actively exploited, or CVSS ≥ 9.0, in a runtime dependency
  - `high` — CVSS 7.0–8.9, or the package is deprecated/unmaintained
  - `medium` — CVSS 4.0–6.9, or a bug fix affecting code actually called
  - `low` — minor advisory, or a dev-only dependency
  - `maintenance` — no advisory; routine currency only

  Risk (what it costs — semver + changelog + call-site analysis):
  - `none` — patch, no API surface change, no call sites touched
  - `low` — minor, additive only
  - `medium` — major with a mechanical migration (rename/import moves)
  - `high` — major with semantic behavior change, or codegen/native impact

- **`tier` is a function of `risk`, not `urgency`:**
  `risk` none/low → `tier: safe` · `risk` medium → `tier: review` ·
  `risk` high → `tier: breaking`.

- **`dependency-audit` and `toolchain-audit` set a *provisional* `risk`** from
  semver/bump-type alone, leave `verdict`/`evidence`/`affected_call_sites`
  empty, and still set `tier` from that provisional risk so a table can be
  grouped before the safety gate runs.

- **`dependency-update-audit` is the only skill allowed to write `verdict` and
  `evidence`.** It may upgrade `risk` (and therefore `tier`) based on what it
  actually finds; it never downgrades urgency. A verdict without evidence
  citing real command output is invalid — see that skill's red flags. This
  includes a **downgrade from its own batch-verification step**: a candidate
  individually verified `safe` can still end up `needs-refactor` or `blocked`
  once tested together with the rest of its tier — see that skill's "Batch
  verification" section. There is no separate "batch verdict" field; a batch
  failure is always attributed back to the specific candidate(s) responsible,
  using these same fields.

- **`upgradable` vs. `latest_compatible` are two different honest answers,
  report both when they differ.** `upgradable` costs nothing (no manifest
  edit); `latest_compatible` is the furthest you could go by editing just
  this package's pin, and may carry real breaking changes `upgradable`
  doesn't. Omit/null `upgradable` when it equals `current` (nothing free
  available) or `latest_compatible` (no meaningful distinction) — only show
  it when it actually adds information.

- **`kind: "toolchain"`** records use the same fields; `manifest` points at the
  toolchain's *primary* version file (e.g. `.fvmrc`) as an anchor/label only —
  a toolchain bump routinely touches several files at once, and the full set
  always comes from that component's `references/toolchains/<name>.md`
  adapter (its `version_file(s)` slot), never from re-parsing `manifest`.
  `affected_call_sites` is typically empty in favor of native-project/CI
  impacts noted in `breaking_changes`.

- **The proposed target is `latest_compatible`, unless a candidate is
  explicitly a major-version campaign.** `dependency-update-audit` audits
  (and, later, `dependency-update-apply` applies) `latest_compatible` by
  default — the version resolvable without loosening manifest constraints.
  Only treat `latest` as the target when `latest_compatible == current` (no
  compatible update exists) and a human has explicitly asked to pursue the
  major bump; in that case say so in `evidence`/the PR body rather than
  leaving it implicit.

- **`evidence.log` may contain a mechanical-fix description, not just command
  output.** For a `safe-with-refactor` verdict, `dependency-update-audit`
  records the concrete edit it made on the scratch branch (not just pass/fail
  output) so `dependency-update-apply` can reproduce the same edit on the real
  branch. Write it as a specific, reproducible instruction (file, change,
  reason) — "made a small fix" is not evidence any more than "should be fine"
  is a verdict.

- **`dependency-audit`'s `scripts/fetch_updates.py` adds three fields beyond
  this schema's core shape**, all script-produced and all consumed (not
  necessarily persisted) downstream:
  - `changelog_excerpt` — transient. The raw, trimmed changelog text between
    `current` and the target version. `dependency-audit` reads this and
    writes `breaking_changes` from it; the excerpt itself doesn't need to
    survive into the final `candidates.json` once that's done.
  - `current_source` — `"lockfile"` (the common case) or
    `"manifest_fallback"` (the outdated check couldn't determine `current`,
    e.g. no lockfile exists for that manifest, so the script read the
    manifest-declared version directly instead). Treat `manifest_fallback`
    as less certain than `lockfile` — it reflects what's *declared*, not
    necessarily what's actually resolved.
  - `fetch_error` — present only when a per-package registry/advisory/
    changelog call failed or came back unparseable. Never treat a missing
    field as "nothing went wrong" without checking for this one too; a
    candidate with `fetch_error` set still has whatever it *did* manage to
    fetch (partial data), so don't discard the whole record.
