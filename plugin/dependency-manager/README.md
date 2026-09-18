# dependency-manager

A Claude Code plugin that audits, safety-verifies, applies, and opens PRs for
dependency and toolchain updates — designed to be ecosystem-agnostic rather
than tied to any one package manager or language.

## What's in the box

```
agents/
  dependency-manager.md        the orchestrator: sequences the pipeline stages
                                below and enforces the human-in-the-loop
                                checkpoint between "safety gate" and "apply"
skills/
  dependency-audit/            stage 1: read-only inventory + grading of
                                package-manifest dependencies
  toolchain-audit/             stage 1b: same, for SDK/build-tool pins
  dependency-update-audit/     stage 2: the safety gate — proves a proposed
                                bump safe or unsafe with real command output,
                                never from reading a changelog alone
  dependency-update-apply/     stage 3: applies a proven-safe bump for real
  dependency-doc-sync/         stage 4: keeps this repo's own docs from going
                                stale after a bump lands
  dependency-update-pr/        stage 5: pushes the branch and opens the PR
examples/
  dependencies.md              a filled example of the repo-level policy file
                                (`.claude/rules/dependencies.md`) the agent
                                expects — written for a Dart/Flutter repo
```

## How the pipeline stays ecosystem-agnostic

Every skill is written against **adapter files**, never against a specific
package manager or language directly:

- `skills/dependency-audit/references/ecosystems/_template.md` +
  `_template.json` — the interface a package ecosystem (pub, npm, cargo,
  pip, ...) fills in: how to detect it, what command lists outdated
  packages, where to check the registry/advisories/changelog.
- `skills/toolchain-audit/references/toolchains/_template.md` — the
  interface an SDK/build-tool component (a language runtime, a build
  plugin, ...) fills in: where its version pin lives, where to check for a
  new release, what its migration guide looks like, what it breaks when it
  moves.

A `dart-flutter.md`/`dart-flutter.json` pair and a `flutter.md` toolchain
adapter ship as **worked examples** (pub/Flutter), so a new Flutter repo
adopting this plugin has a running-start reference to copy and adjust rather
than starting from a blank template. Adding support for a different
ecosystem is: copy the `_template` file(s), fill in the slots grounded in
the target repo's actual files, done — no skill file needs to change.

The shared data contract every stage reads/writes is
`skills/dependency-audit/references/report-schema.md` — read that first if
you're trying to understand the pipeline's output shape.

## Installing into a repo

1. Copy this plugin (or install it via your Claude Code plugin
   marketplace/mechanism of choice) so `agents/dependency-manager.md` and
   `skills/*` are available to Claude Code in the target repo.
2. Create `.claude/rules/dependencies.md` in the target repo — the agent
   treats this as the authoritative policy for manifest layout, pin style,
   a never-auto-update list, and the update-cadence/security SLA. Use
   `examples/dependencies.md` as a starting point if the target repo is
   Dart/Flutter; otherwise write your own following its shape.
3. If the target repo's ecosystem isn't Dart/Flutter, add an ecosystem
   adapter (`skills/dependency-audit/references/ecosystems/<name>.md` +
   `.json`) and, if toolchain auditing is in scope, a toolchain adapter
   (`skills/toolchain-audit/references/toolchains/<name>.md`) following the
   `_template` files.
4. Invoke the `dependency-manager` agent. It reads the rule file and
   adapters itself before doing anything — nothing else to configure.

## What it will never do without asking

The agent stops after the safety-gate stage and waits for an explicit,
tier-by-tier human go-ahead before applying anything or opening a PR — see
"Checkpoint protocol" and "Refusal rules" in `agents/dependency-manager.md`.
It also never bypasses verification to write a verdict, never force-pushes
or skips git hooks, and never lets a never-auto-update-list package
(codegen-driving packages, typically) go through an automated apply without
a human-reviewed diff.
