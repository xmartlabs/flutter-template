---
name: dependency-doc-sync
description: Use when a dependency-update-apply run for a tier has committed version bumps and this repo's own documentation — CLAUDE.md, README.md, .claude/rules/*.md, or a toolchain/ecosystem adapter's hardcoded version annotations — may now be stale, before dependency-update-pr opens the PR.
---

# Dependency Doc Sync

Stage 4: closes the loop on documentation this pipeline (and the repo) keeps
as prose, so a version bump doesn't leave a stale "currently X" note behind
for the next reader or the next audit run. Runs on the same branch
`dependency-update-apply` just committed to, before `dependency-update-pr`
pushes it. Schema/field rules live in
`../dependency-audit/references/report-schema.md`; don't restate them here.

## Scope: docs, not code

Never touches application code, manifests, or lockfiles — that's
`dependency-update-apply`'s job, already done by the time this runs. This
skill only edits:

- `CLAUDE.md` and `README.md`, if present, where either quotes a version tied
  to a candidate this run applied.
- `.claude/rules/*.md`.
- Adapter reference files under `.claude/skills/*/references/**` —
  specifically an ecosystem or toolchain adapter's own hardcoded
  "current"/"currently `<version>`" annotations.

## Per-candidate procedure

1. For each candidate `dependency-update-apply` actually applied on this
   branch, search each in-scope doc for that candidate's exact *old* version
   string appearing where the doc is clearly describing this package or
   component — never a blind find-and-replace across a whole file on version
   number alone, since the same string can appear for unrelated reasons.
2. For a `kind: "toolchain"` candidate, always check its
   `../toolchain-audit/references/toolchains/<name>.md` adapter: update every
   "current"/"currently `<version>`" annotation for the file(s) that changed
   (e.g. `flutter.md`'s `.fvmrc`/AGP/Kotlin/Gradle "currently" notes). That
   file is `toolchain-audit`'s own baseline — leaving it stale makes the next
   audit report a false diff against reality.
3. For a `kind: "package"` candidate, check `CLAUDE.md`/`README.md` for a
   literal version mention tied to that package. Most package bumps won't
   have one — report "no doc reference found" for that candidate rather than
   editing something unrelated to manufacture a change.
4. If this run's applied candidates resolved the `dependency_overrides`
   standing issue documented in `.claude/rules/dependencies.md` (verify from
   `dependency-update-apply`'s evidence, not from the package name alone),
   update or remove that "Known standing issue" section.
5. Commit doc edits **separately** from the version-bump commit(s):
   `docs: sync references after <tier> dependency update`, same branch — keep
   app-code and doc-only commits distinguishable in history.
6. If no doc needed a change, say so explicitly and make no commit — an empty
   doc commit is noise, not evidence of work done.

## Constraints

- **Evidence-based edits only.** Every edit must cite the doc file, the exact
  old string found, and the new string it was replaced with. No edit without
  a located, exact match — "this is probably stale now" is not grounds to
  touch a doc.
- Never touch anything outside the doc allowlist above.
- Never introduce a claim a doc didn't already make (e.g. don't add a new
  "supported versions" table where none existed) — only correct what's
  already there and now stale.

## Handoff

Report which files were touched, and with what edit, or "none this run" —
`dependency-update-pr` includes this verbatim in the PR body's "Docs updated"
section.
