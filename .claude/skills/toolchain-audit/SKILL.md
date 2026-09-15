---
name: toolchain-audit
description: Use when auditing this repo's SDK/runtime/build-tool version pins — whatever components have an adapter under `references/toolchains/` (currently the Flutter SDK pin, the Dart SDK constraint, and Android build tooling: AGP, Kotlin, Gradle wrapper) — for currency against upstream stable releases.
---

# Toolchain audit

Audits toolchain/SDK components — as opposed to pub/npm packages, which
`dependency-audit` handles — and emits the same candidate shape defined in
`../dependency-audit/references/report-schema.md` with `"kind": "toolchain"`.
Read that schema file before touching this skill's output; it is not restated
here.

Toolchain components have their own release cadence, publish structured
migration guides rather than package changelogs, and carry a much larger
blast radius per bump (native Android/iOS project regeneration, CI config)
than a package version bump. That's why they're a separate skill from
`dependency-audit` and why `.claude/rules/dependencies.md` requires them to
always land as their own PR, never bundled into a package-update tier.

## Workflow

1. **Enumerate components.** For each file under `references/toolchains/`,
   use its `detect` and `version_file(s)` slots to find the component's
   current pin in this repo. Start with `toolchains/flutter.md` (Flutter SDK,
   Dart constraint, AGP, Kotlin, Gradle wrapper); add adapters for Ruby and
   CI runner images the same way once written.

2. **Check currency.** For each component, query its adapter's
   `latest_version_source` for the current stable release and compare against
   the pinned version.

3. **Summarize the real migration path.** For any component behind, pull the
   adapter's `migration_guide_source` and summarize concrete steps and
   breaking changes — not a "see release notes" placeholder. Prefer citing an
   actual prior upgrade's diff in this repo, once one exists, over the
   adapter's illustrative worked example (see `toolchains/flutter.md`) — real
   evidence always beats a generic reading of the guide.

4. **Emit candidates.** Write one record per component into the same
   `candidates.json` the pipeline shares, per report-schema.md: `kind:
   "toolchain"`, `manifest` pointing at the adapter's `version_file`,
   `breaking_changes` populated from step 3, `affected_call_sites` left
   empty (native-project/CI impacts go in `breaking_changes` instead, per
   the adapter's `native_project_impacts`/`ci_impacts` slots). Set the
   provisional `risk` from blast radius, not just semver distance: a bump
   whose adapter lists non-empty `native_project_impacts` or `ci_impacts` is
   at least `risk: medium`, and `high` when both are non-empty or a native
   build is required to verify it (as with an AGP/Kotlin/Gradle bump).
   Derive `tier` from `risk` per the schema's mapping.

5. **Stop here.** This skill only produces candidates — it never edits a
   version file, regenerates native projects, or opens a PR. Emitted records
   feed into `dependency-update-audit`'s safety-gate stage exactly like
   package candidates, and only that stage (plus `dependency-update-apply`/
   `dependency-update-pr` downstream) acts on them.

## Hard rule

Never merge a toolchain candidate into a package-update PR's tier grouping,
even when both happen to be `tier: safe` — `.claude/rules/dependencies.md`
requires the Flutter SDK and Android build tooling to always ship as their
own `review`-or-higher tier PR, separate from any package bump.

## Adding a new toolchain component

Copy `references/toolchains/_template.md` to
`references/toolchains/<name>.md`, fill in every slot grounded in this repo's
actual files (never guess a slot — mark it `<!-- OPEN QUESTION -->` if
unverified), and add nothing else; no change to this file is needed.
