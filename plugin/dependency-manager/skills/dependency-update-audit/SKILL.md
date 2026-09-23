---
name: dependency-update-audit
description: Use when a candidates.json produced by dependency-audit or toolchain-audit contains records with a null verdict and those updates need to be proven safe or unsafe before any apply/PR step runs.
---

# Dependency Update Audit

Safety gate of the dependency-maintenance pipeline. It is the only skill
allowed to write `verdict` and `evidence` on a candidate record (schema and
field rules: `../dependency-audit/references/report-schema.md` — don't
restate them here). It may upgrade `risk`/`tier` from evidence; it never
downgrades them and never touches `urgency`.

## Core rule: no verdict without evidence

A `verdict` is only valid if this skill actually ran verification for that
specific candidate in this session and can cite the command and its exit
code/output. If you cannot get that far for a candidate — ambiguous
manifest, missing adapter file, environment failure unrelated to the bump —
leave `verdict` as `null` and record why in `evidence`, or set `verdict:
"blocked"` with the evidence that shows what blocked it. Never write
`"safe"` from reading a changelog alone.

## Per-candidate procedure

1. Load the ecosystem adapter — check `.claude/dependency-manager/ecosystems/<ecosystem>.md`
   in this repo first, then this plugin's bundled
   `../dependency-audit/references/ecosystems/<ecosystem>.md` (interface in
   `_template.md`): `changelog_convention`, `post_update_hooks`,
   `verification_cmd`, `never_auto_list`. `dependency-audit` already
   resolved and, if needed, drafted this adapter in stage 1 — it should
   exist in one of the two locations by the time this stage runs.
2. If `package` is on the never-auto-update list in `.claude/rules/dependencies.md`
   (or the adapter's `never_auto_list`), flag it prominently up front. It still
   gets audited below, but the verdict must note a human-reviewed regeneration
   diff is required regardless of how checks come out.
3. Fetch the real changelog/release notes between `current` and the proposed
   target via `changelog_convention` and read them — extract concrete
   breaking-change entries into `breaking_changes`, not "see changelog."
4. Grep the codebase for call sites of the *specific APIs* the changelog says
   changed (not just the package name). Populate `affected_call_sites` with
   real `path:line` hits, or `[]` if a targeted search finds none.
5. Create an isolated scratch branch (never the human's working branch), edit
   the manifest to the proposed target using the same scripts
   `dependency-update-apply` uses —
   `../dependency-update-apply/scripts/bump_manifest.py` (package
   candidates, `--pin-style preserve` by default) or
   `../dependency-update-apply/scripts/bump_toolchain_file.py` (toolchain
   candidates, once per file in the adapter's `version_file(s)` set) — never
   a free-form text edit. Both stages applying a bump identically removes one
   more way two independent runs could diverge. Then run `install_cmd`, then
   any `post_update_hooks` (codegen).
6. Run `verification_cmd` as this repo's `.claude/rules/dependencies.md` (or
   the adapter, if the rule file defers to it) names it — typically a single
   script covering format/lint/analyze/test across every package the repo
   defines, run once per package if the repo has more than one. Capture the
   real exit status and any failing output.
7. Separately check codegen-cleanliness, if the ecosystem has generated code:
   rerun whatever regenerates it (the adapter's `post_update_hooks`), then
   check `git status` is clean. A dirty tree here fails the candidate even if
   `verification_cmd` passed.
8. Record exit codes, pass/fail, and relevant log excerpts verbatim into
   `evidence` (`{checks, codegen_clean, log}`).
9. Assign `verdict` from that evidence only: `safe` (checks pass, codegen
   clean, no breaking-change note touches a real call site); `safe-with-refactor`
   (checks pass only after this skill made and documents a mechanical fix
   on the scratch branch); `needs-refactor` (checks or codegen-cleanliness
   fail in a way needing a human decision); `blocked` (never reached a clean
   baseline — conflicting transitive constraints, adapter/install failure).
10. If evidence contradicts stage 1's provisional `risk` (e.g. a "minor"
    bump broke `verification_cmd`), raise `risk`/`tier` accordingly — never
    lower it.
11. Delete/abandon the scratch branch — always, regardless of outcome. This
    skill proposes nothing to the real branch; that's `dependency-update-apply`.

## Batch verification (multi-candidate tiers)

Each candidate above was proven safe **alone**. Bumping several at once can
still hit a transitive conflict, or break something only visible when they
all change together — neither shows up one-at-a-time. Run this once, after
every candidate in a tier has an individual verdict. Skip if fewer than 2
candidates are `safe`/`safe-with-refactor` — nothing to combine. Toolchain
candidates are excluded; they always ship solo per
`.claude/rules/dependencies.md`.

1. One new scratch branch. Apply every `safe`/`safe-with-refactor` candidate
   in the tier together (same bump scripts as a solo run, just all of them
   first), then `install_cmd`. If the combined set doesn't even resolve,
   that's a transitive conflict — record it, skip to step 3.
2. If it resolves, run `verification_cmd` + codegen-cleanliness as usual.
3. **Passes** → no verdict changes; note in each candidate's `evidence.log`
   that it was also confirmed as part of an N-candidate batch, so
   `dependency-update-apply` doesn't need to redo this.
   **Fails** → bisect (remove candidates until the failure is attributable)
   and downgrade only the implicated one(s): `blocked` if resolution itself
   never succeeded with it included (log which candidate(s) it conflicts
   with); `needs-refactor` if resolution succeeded but `verification_cmd`
   only failed with it included (real code needs to change, not just a
   version bump). Re-run this procedure on the remaining candidates to
   confirm they still pass together.
   There's no separate "batch verdict" — every outcome lands on the specific
   candidate(s) responsible, via the same `verdict`/`evidence` fields as
   everywhere else. That's also why the report looks the same whether
   someone audited one dependency or all of them.
4. Delete/abandon the batch scratch branch regardless of outcome.

## Red flags — stop and get real evidence

| Rationalization | Reality |
|---|---|
| "Changelog says it's just a minor/patch bump" | Semver claims aren't evidence. Run `verification_cmd`. |
| "`verification_cmd` is slow, I'll skim the diff instead" | A verdict without an exit code is a guess with a template. |
| "It's only a dev-dependency" | Dev-deps still gate CI — verify like any other. |
| "No call sites matched my grep, must be fine" | Grep the exact changed APIs from the changelog, not the package name; a miss counts only if the search was specific. |
| "`verification_cmd` passed, good enough" | Codegen-cleanliness is also required. Dirty generated output after passing checks is still a failure. |
| "Never-auto-update but checks passed" | Still needs the human regen-diff flag — passing checks doesn't exempt it. |
| "I'll mark it safe now and verify later" | There is no "later." Verify before writing the verdict, not after. |
| "Each candidate passed alone, the tier is safe" | Bumping them together is a different question — run the batch verification before saying so. |
