---
name: dependency-update-apply
description: Use when a verdicts.json produced by dependency-update-audit contains candidates with a non-null, non-blocked verdict for one safety tier and those updates need to be applied for real onto a dedicated branch, before any PR is opened.
---

# Dependency Update Apply

Stage 3: turns proven-safe verdicts into real commits on a dedicated branch.
Never opens a PR — that's `dependency-update-pr`'s job. Schema/field rules
live in `../dependency-audit/references/report-schema.md`; don't restate
them here.

## Scope: one tier, one kind, per run

Filter `verdicts.json` to exactly one `tier` (`safe`|`review`|`breaking`)
and one `kind` (`package`|`toolchain`) before starting. Never mix tiers or
kinds in one branch/commit — a toolchain candidate always ships as its own
branch/PR per `.claude/rules/dependencies.md`, even if it's `tier: safe`.

## Preconditions

1. `git status` must be clean — refuse to apply on a dirty tree.
2. Drop candidates whose `verdict` is `blocked` or still `null`.
3. Never touch the never-auto-update list
   (`.claude/rules/dependencies.md`: `freezed`/`freezed_annotation`,
   `build_runner`, `json_serializable`/`json_annotation`,
   `auto_route`/`auto_route_generator`, `flutter_gen_runner`) as part of a
   `safe`-tier apply, even if its own verdict came back `safe` — it needs
   `review`-or-higher treatment with a human-reviewed regen diff. Filter it
   out of a `safe` run.
4. Always cut a new branch; never commit to the human's current branch.

## Branch naming

`chore/deps-<tier>-<YYYYMMDD>`, e.g. `chore/deps-safe-20260911`.

## Per-candidate procedure

1. Load the adapter: package candidates use
   `../dependency-audit/references/ecosystems/<ecosystem>.md`; toolchain
   candidates use `../toolchain-audit/references/toolchains/<package>.md`.
2. Edit the manifest(s) with a script — never a free-form text edit, which
   can silently change a dependency's pin style under pressure:
   - `kind: "package"`: run `scripts/bump_manifest.py --manifest <path>
     --package <name> --version <target> --pin-style preserve`. `preserve`
     (the default) keeps whatever prefix (none, `^`, `~`) and quoting the
     line already has and replaces only the version digits — it never adds
     a range operator that wasn't there, and never strips one that was. Use
     `--pin-style exact` only if `.claude/rules/dependencies.md` explicitly
     calls for normalizing to an exact pin; don't assume that's the policy.
   - `kind: "toolchain"`: `manifest` names only one file the component
     touches — use the adapter's `version_file(s)` slot for the full set
     (e.g. `flutter.md`: `.fvmrc`, `pubspec.yaml`'s
     `environment.flutter`/`environment.sdk`, `android/settings.gradle`'s AGP
     and Kotlin versions, the Gradle wrapper properties file — four
     different file formats). Run `scripts/bump_toolchain_file.py --file
     <path> --old-version <current> --new-version <target>` once per file;
     add `--line-contains <substring>` (e.g. `"com.android.application"` vs
     `"kotlin.android"`) when a file has more than one unrelated version
     number, so the script can't match the wrong line.
   - Either script refuses (nonzero exit, no edit) rather than guessing on
     zero or multiple matches, or on a map-style dependency declaration
     (`sdk:`/`path:`/`git:`) — treat a refusal as a real stop, not something
     to route around with a manual edit.
3. Run the adapter's `install_cmd`, then any `post_update_hooks` (codegen).
4. If `verdict` is `safe-with-refactor`, replay the mechanical fix
   `dependency-update-audit` already proved necessary: read that
   candidate's `evidence.log` and reproduce the concrete edit it describes
   on the real branch — don't just redo the bump and hope checks pass again.
5. Re-run the adapter's `verification_cmd` on the real branch now — don't
   trust stage 2's scratch-branch result, since prior candidates already
   applied in this run (or drift since the scratch branch was cut) may
   change the outcome. Toolchain candidates also run their adapter's extra
   verification (e.g. a real native build, if the adapter requires one).
6. Re-run codegen-cleanliness, if the ecosystem has generated code: rerun
   whatever regenerates it (the adapter's `post_update_hooks`), confirm
   `git status` is clean afterward. A dirty tree here fails the candidate
   even if step 5 passed.
7. If verification fails despite a `safe`/`safe-with-refactor` verdict, stop
   applying further candidates on this branch and report the discrepancy —
   don't silently skip or downgrade.

## Committing

- Single-package tier: `chore: bump <package> <current> → <target>`, e.g.
  `chore: bump dio 5.4.3+1 → 5.9.0`.
- Multi-package batch: one summary commit,
  `chore: bump <tier> dependencies (<n> packages)`, listing each
  package/version pair in the commit body.
- Toolchain candidates are always single-candidate commits (own branch/PR):
  `chore: bump flutter <current> → <target>`.

## Handoff

Leave the branch at HEAD with this run's candidates committed (push is
`dependency-update-pr`'s call, made after `dependency-doc-sync` has had its
turn on the same branch). Report the branch name and per-candidate outcome;
`dependency-update-pr` reads `verdicts.json` for PR-body content and does not
re-verify anything this skill already confirmed.
