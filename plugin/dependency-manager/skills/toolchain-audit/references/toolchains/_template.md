# Toolchain adapter template

A toolchain adapter is the *only* place a given SDK/build-tool's specific
knowledge lives. `toolchain-audit` is written against these slots and never
hardcodes a version-file path, release-notes URL, or migration-guide URL
inline. To support a new toolchain component, copy this file to
`toolchains/<name>.md`, fill in every slot, and add nothing else — no skill
file changes.

See `flutter.md` for a filled-in example.

## Where an adapter lives: two locations, checked in order

Same mechanism as ecosystem adapters (see
`../../../dependency-audit/references/ecosystems/_template.md`): a
repo-local adapter at `.claude/dependency-manager/toolchains/<name>.md` in
the target repo is checked first and wins if present; this plugin's own
bundled `${CLAUDE_PLUGIN_ROOT}/skills/toolchain-audit/references/toolchains/<name>.md`
is the fallback. Never create or edit a file under `${CLAUDE_PLUGIN_ROOT}` —
a new toolchain adapter always gets drafted at the repo-local path instead.

## Required slots

| Slot | Meaning |
|---|---|
| `detect` | File(s)/glob whose presence means this toolchain component is in use in this repo |
| `version_file(s)` | Where the current pin lives (may be more than one file if a version is duplicated, e.g. an SDK constraint mirrored in a manifest) |
| `latest_version_source` | Official page/API/feed to check for the current stable release — not a package registry |
| `migration_guide_source` | Official structured migration-guide location for major/breaking bumps — SDKs publish these separately from changelogs; never substitute a changelog here |
| `native_project_impacts` | Native/generated project files a bump typically forces regeneration of or manual review in (e.g. Android Gradle files, iOS project files, generated launcher icons/splash) |
| `ci_impacts` | CI workflow files, composite actions, or repo/org-level variables a bump typically requires updating |
| `verification_cmd` | This project's canonical "did this break anything" command(s) for this component — prefer a script the repo already defines over a hand-rolled invocation |

## Notes for adapter authors

- A toolchain bump's evidence is a migration guide and a real diff, not a
  changelog entry — cite concrete file-level changes a past bump made
  wherever you can (a prior upgrade PR is the best source), not a generic
  "check release notes" pointer.
- `native_project_impacts` and `ci_impacts` are what set `risk`/`tier` in
  `../../dependency-audit/references/report-schema.md` — a component with
  either non-empty is at least `risk: medium`.
- If a slot can't be verified against the actual repo, mark it with
  `<!-- OPEN QUESTION: ... -->` rather than guessing.
