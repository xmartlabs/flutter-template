# pnpm adapter

Worked example for a pnpm-managed JS/TS project (`package.json` +
`pnpm-lock.yaml`).

| Slot | Value |
|---|---|
| `detect` | `package.json` with `pnpm-lock.yaml` present alongside it. |
| `manifests` | `package.json`. In a pnpm workspace (`pnpm-workspace.yaml`), root plus every workspace member's own `package.json`. |
| `lockfile` | `pnpm-lock.yaml`. |
| `outdated_cmd` | `pnpm outdated --format json` — object keyed by package name, each value carrying `current`/`latest`/`wanted`/`isDeprecated`/`dependencyType`. |
| `install_cmd` | `pnpm install`. |
| `registry_api` | npm registry: `GET https://registry.npmjs.org/<name>` — pnpm resolves against the npm registry by default, same as npm/Yarn. |
| `advisory_source` | OSV.dev, ecosystem `npm`. pnpm also has a native `pnpm audit --json`, redundant with OSV.dev but worth cross-checking. |
| `changelog_convention` | Same as npm: check the registry response's `repository` field, then `CHANGELOG.md`/GitHub Releases at that repo. |
| `version_scheme` | Semver, standard. |
| `post_update_hooks` | None by default. |
| `verification_cmd` | Check `package.json`'s `"scripts"` block first, same as npm/Yarn. |
| `never_auto_list` | Empty by default. A repo's own `.claude/rules/dependencies.md` is authoritative. |

## Notes for adapter authors

- `pnpm outdated --format json`'s object-keyed-by-name shape differs from
  npm's array-of-objects and Yarn's row-table — a consuming script needs to
  handle each of the three shapes distinctly if it ever parses this output
  directly rather than delegating to a script per ecosystem.
- pnpm's workspace filtering flags (`--filter`) can scope `outdated_cmd` to
  a subset of packages — when auditing a monorepo, decide whether to run it
  once per workspace member or once at the root with no filter (which
  reports across the whole workspace) and document that choice here for the
  real repo.
