---
name: dependency-audit
description: Use when a dependency-maintenance run needs a fresh inventory of a repo's package dependencies — current vs. available versions, security advisories, and a graded update-candidate report — before any update decision or code change is made.
---

# Dependency audit

Stage 1 of the dependency-maintenance pipeline: read-only inventory and
grading. It never edits a manifest or applies an update — that's
`dependency-update-audit` and `dependency-update-apply`'s job, downstream.
See `references/example-output.md` for a worked `candidates.json` +
printed-summary example if the target output shape is unclear.

## Workflow

1. **Detect the ecosystem(s) and locate each adapter.** Use each adapter's
   `detect` slot to identify what's present, checking two locations in
   order: this repo's own `.claude/dependency-manager/ecosystems/<name>.{md,json}`
   first, then this plugin's bundled
   `${CLAUDE_PLUGIN_ROOT}/skills/dependency-audit/references/ecosystems/<name>.{md,json}`
   (`references/ecosystems/` relative to this file) — `dart-flutter`, `npm`,
   `yarn`, `pnpm`, `python-pip`, `python-poetry`, `python-uv` ship there
   today. A repo-local adapter of the same name overrides the bundled one.

   If a manifest is detected (`pyproject.toml`, `package.json`, etc.) with
   no adapter in either location, don't fail and don't guess: copy
   `references/ecosystems/_template.md` + `_template.json`, fill every slot
   from this repo's real files and commands, and write the result to the
   **repo-local** path — `.claude/dependency-manager/ecosystems/<name>.{md,json}`.
   Never write a new or edited adapter into `${CLAUDE_PLUGIN_ROOT}`; it's
   shared across every repo this plugin is installed in. Stop after writing
   it and tell the human a new adapter was drafted and needs review before
   you rely on it for grading or verification — don't continue the audit on
   an unreviewed adapter in the same run.

2. **Read every manifest** the adapter's `manifests` slot lists. For a
   multi-package repo, that's every package, not just the root.

3. **Run `scripts/fetch_updates.py`, once per manifest.** This one call
   replaces running `outdated_cmd` and querying `registry_api`/
   `advisory_source`/`changelog_convention` by hand:

   ```
   python3 scripts/fetch_updates.py --config <resolved adapter .json path from step 1> --manifest-dir <dir>
   ```

   It runs the outdated-versions check, hits the registry, batch-queries
   advisories, and fetches+trims the changelog for every outdated
   direct/dev dependency, printing one JSON array per manifest. It also
   computes `urgency`, a provisional `risk`, and `tier` deterministically —
   see `references/report-schema.md`'s rubric for exactly how, if you need
   to sanity-check its output. Don't reimplement any of this in bash; if a
   manifest needs something the script doesn't support, that's a
   config/script gap to report, not something to work around ad hoc.

4. **Grade each candidate.** `urgency`/`risk`/`tier` arrive already computed.
   Your remaining job per candidate: read its `changelog_excerpt` field and
   write concrete `breaking_changes` bullets from it — a reading-comprehension
   task the script deliberately leaves to you. If a candidate instead carries
   a `fetch_error` (network hiccup, or the changelog genuinely has no entry
   for the target version — both real, not just parsing failures), leave
   `breaking_changes: []` and note the gap in the printed summary rather than
   guessing. Leave `verdict`, `evidence`, and `affected_call_sites` empty —
   this skill does not analyze call sites or run verification.

5. **Write `candidates.json`** to the session scratchpad (never into the
   repo): the combined records from every manifest's script run, in the
   exact shape defined by `references/report-schema.md`.

6. **Print a human-readable summary** grouped by `tier`. For any candidate
   with a non-null `upgradable`, call out both options explicitly — e.g.
   "10.3.4 available with no manifest edit; 11.1.1 available if you take the
   breaking changes below" — don't only show the (possibly riskier)
   `latest_compatible` target and bury the zero-risk one. Also explicitly call
   out, as standing findings (never silently folded into or dropped from the
   normal candidate list):
   - Any package on the ecosystem's `never_auto_list` (see the adapter) that
     has an available update.
   - The `dependency_overrides` TODO block documented in
     `.claude/rules/dependencies.md` — surface it every run until it's
     resolved upstream.

## Constraints

- **Read-only.** Never edit a manifest (`pubspec.yaml` or equivalent) and
  never run an update/upgrade command. `scripts/fetch_updates.py` itself only
  ever runs the adapter's `outdated_cmd` (read-only) — it never runs the
  ecosystem's upgrade command (e.g. `pub upgrade`) and never writes to the
  repo; treat any change it reveals in `git status` as a bug to report, not
  something to work around.
- Don't restate `references/report-schema.md`, `references/ecosystems/dart-flutter.md`,
  or `scripts/fetch_updates.py`'s own logic inline — point at them.
- Honor `.claude/rules/dependencies.md` as the authoritative policy (pin
  style, never-auto list, update-cadence SLA); the adapter file mirrors it,
  it doesn't override it.
