---
name: dependency-audit
description: Use when a dependency-maintenance run needs a fresh inventory of a repo's package dependencies — current vs. available versions, security advisories, and a graded update-candidate report — before any update decision or code change is made.
---

# Dependency audit

Stage 1 of the dependency-maintenance pipeline: read-only inventory and
grading. It never edits a manifest or applies an update — that's
`dependency-update-audit` and `dependency-update-apply`'s job, downstream.

## Workflow

1. **Detect the ecosystem(s).** Use each adapter's `detect` slot under
   `references/ecosystems/` to identify what's present. This repo is
   Dart/Flutter — see `references/ecosystems/dart-flutter.md`. A future repo
   with a `package.json` would be picked up the same way by an `npm.md`
   adapter, with no change to this skill.

2. **Read every manifest** the adapter's `manifests` slot lists. For a
   multi-package repo, that's every package, not just the root.

3. **Run `outdated_cmd`** per manifest to get current vs. available versions
   for every dependency and dev dependency.

4. **For each outdated package**, gather evidence before grading it:
   - Query `registry_api` for the full version list and metadata.
   - Query `advisory_source` for known vulnerabilities against the currently
     pinned version.
   - Locate the changelog via `changelog_convention`.

5. **Grade each candidate** per `references/report-schema.md`'s rubric:
   - `urgency` from advisories/deprecation status.
   - A **provisional** `risk` from bump-type alone (patch → `none`, minor →
     `low`, major → `medium` as a starting guess) — this is refined later by
     `dependency-update-audit`, which is the only skill allowed to upgrade it
     with real evidence.
   - `tier` derived from that provisional `risk`, per the schema's mapping.
   - Leave `verdict`, `evidence`, and `affected_call_sites` empty — this skill
     does not analyze call sites or run verification.

6. **Write `candidates.json`** to the session scratchpad (never into the
   repo), one record per outdated package, in the exact shape defined by
   `references/report-schema.md`.

7. **Print a human-readable summary** grouped by `tier`, and explicitly call
   out, as standing findings (never silently folded into or dropped from the
   normal candidate list):
   - Any package on the ecosystem's `never_auto_list` (see the adapter) that
     has an available update.
   - The `dependency_overrides` TODO block documented in
     `.claude/rules/dependencies.md` — surface it every run until it's
     resolved upstream.

## Constraints

- **Read-only.** Never edit a manifest (`pubspec.yaml` or equivalent) and
  never run an update/upgrade command. Running the adapter's `outdated_cmd`
  and `install_cmd` (e.g. `pub get`) is fine — neither mutates a manifest —
  but never run the ecosystem's upgrade command (e.g. `pub upgrade`).
- Don't restate `references/report-schema.md` or
  `references/ecosystems/dart-flutter.md` inline — point at them.
- Honor `.claude/rules/dependencies.md` as the authoritative policy (pin
  style, never-auto list, update-cadence SLA); the adapter file mirrors it,
  it doesn't override it.
