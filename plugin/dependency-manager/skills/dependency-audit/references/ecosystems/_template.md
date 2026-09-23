# Ecosystem adapter template

An ecosystem adapter is the *only* place package-manager-specific knowledge
lives. `dependency-audit`, `dependency-update-audit`, and
`dependency-update-apply` are all written against these slots and never
hardcode a command, file name, or registry URL. To support a new ecosystem,
copy this file to `ecosystems/<name>.md` **and** copy `_template.json` to
`ecosystems/<name>.json` — fill in every slot in both, and add nothing else:
still zero skill-file changes.

The `.md` is the human/LLM-readable prose (this file's shape); the `.json`
is the machine-readable sibling that `scripts/fetch_updates.py` actually
reads to do the fetch/enrich work — see that script and `_template.json`
for its slots, which mirror most of the ones below. Keep both in sync: if
you change a command or URL here, change it there too.

See `dart-flutter.md` + `dart-flutter.json`, `npm.md` + `npm.json`, and
`python-poetry.md` + `python-poetry.json` for filled-in examples covering
three different ecosystems.

## Where an adapter lives: two locations, checked in order

1. **Repo-local**, inside the target repo itself:
   `.claude/dependency-manager/ecosystems/<name>.{md,json}`. This is where an
   adapter for a repo-specific or not-yet-bundled ecosystem belongs, and
   where an override of a bundled adapter belongs too — it's checked first,
   so it wins.
2. **This plugin's own bundled copy**: `${CLAUDE_PLUGIN_ROOT}/skills/dependency-audit/references/ecosystems/<name>.{md,json}` (this directory) —
   the worked examples that ship with the plugin (`dart-flutter`, `npm`,
   `yarn`, `pnpm`, `python-pip`, `python-poetry`, `python-uv`). Used only
   when no repo-local adapter exists for that ecosystem.

**Never create or edit a file under `${CLAUDE_PLUGIN_ROOT}`.** That
directory is the plugin's shared install — every repo with this plugin
installed reads the same copy, and it gets overwritten on the next plugin
update anyway. If a repo is detected as some ecosystem with no adapter in
either location (a manifest file matches no `detect` slot anywhere), the
right move is to draft a new adapter — fill this template from that repo's
real files and commands — and write it to the **repo-local** path, then stop
and tell the human it needs review before it's trusted for grading or
verification. `dependency-audit`'s workflow spells out exactly when this
triggers.

## Required slots

| Slot | Meaning |
|---|---|
| `detect` | File(s)/glob whose presence identifies this ecosystem in a repo |
| `manifests` | All manifest files a full audit must read (list every one in a multi-package repo) |
| `lockfile` | The lockfile name, if any |
| `outdated_cmd` | Command that lists installed vs. available versions, ideally as machine-readable output |
| `install_cmd` | Command to re-resolve dependencies after editing a manifest (run once per manifest listed above) |
| `registry_api` | Base URL/pattern for querying a package's published versions and metadata |
| `advisory_source` | Where security advisories are queried (e.g. an OSV.dev ecosystem name, or a language-specific audit command) |
| `changelog_convention` | How to find a package's changelog/release notes (URL pattern, or "read CHANGELOG.md in the package source") |
| `version_scheme` | Versioning scheme in use, including any non-standard suffixes semver parsers must tolerate |
| `post_update_hooks` | Commands that must run after a manifest edit before verification (codegen, build steps) — `none` if not applicable |
| `verification_cmd` | The project's canonical "did this break anything" command(s) — prefer a script the repo already defines over hand-rolled invocations |
| `never_auto_list` | Packages/components this ecosystem treats as high-blast-radius by default (e.g. anything driving codegen) — a starting point; the project's `.claude/rules/dependencies.md` is authoritative and can extend it |

## Notes for adapter authors

- `dependency-audit` doesn't call `outdated_cmd`/`registry_api`/
  `advisory_source`/`changelog_convention` directly — `scripts/fetch_updates.py`
  does, reading them from your `.json` sibling. The slots below still need
  filling in prose here (so a human/LLM understands the ecosystem), but the
  script is what actually executes against them.
- Prefer the project's own scripts (`package.json` scripts, `Makefile`
  targets, `scripts/*.sh`) over inventing raw tool invocations — mirror
  whatever `CLAUDE.md` or the repo's CI documents as the real gate.
- If a project has multiple manifests (a monorepo/workspace), `manifests`
  must enumerate all of them; `install_cmd` runs once per manifest unless the
  tool has a workspace-aware single invocation.
- `registry_api` and `advisory_source` should return machine-readable data
  (JSON) wherever the registry supports it — audits are evidence-based, not
  guessed.
