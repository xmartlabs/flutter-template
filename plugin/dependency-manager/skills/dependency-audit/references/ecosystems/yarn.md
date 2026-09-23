# Yarn adapter

Worked example for a Yarn Classic-managed JS/TS project (`package.json` +
`yarn.lock`). **Yarn Berry (2.x+, `.yarnrc.yml` with `nodeLinker`/`yarnPath`
present) differs enough — plug'n'play resolution, `yarn npm info` instead of
a registry-shaped `yarn outdated`, no `--json` on `outdated` — that this
adapter should not be assumed for it without re-verifying each command
against the actual installed Yarn major version first.**

| Slot | Value |
|---|---|
| `detect` | `package.json` with `yarn.lock` present, and no `.yarnrc.yml` declaring a Berry-only `nodeLinker` (plain `yarn.lock` presence alone doesn't distinguish Classic from Berry — check the lockfile's own header comment, which states its format version, or `yarn --version`). |
| `manifests` | `package.json`. In a Yarn workspaces monorepo, root plus every workspace member's own `package.json`. |
| `lockfile` | `yarn.lock`. |
| `outdated_cmd` | `yarn outdated --json` (Yarn Classic 1.x). Its JSON output is one object, `{"type": "table", "data": {"head": [...column names...], "body": [[...row...], ...]}}` — a row array per package, not a single array of per-package objects like npm's or pnpm's. Parse the `head` row to map column indices (`Package`, `Current`, `Wanted`, `Latest`, `Package Type`, `URL`) rather than hardcoding positions. |
| `install_cmd` | `yarn install`. |
| `registry_api` | npm registry: `GET https://registry.npmjs.org/<name>` — Yarn Classic still resolves against the npm registry by default. |
| `advisory_source` | OSV.dev, ecosystem `npm` (Yarn packages are npm-registry packages). |
| `changelog_convention` | Same as npm: check the registry response's `repository` field, then `CHANGELOG.md`/GitHub Releases at that repo. |
| `version_scheme` | Semver, standard. |
| `post_update_hooks` | None by default. |
| `verification_cmd` | Check `package.json`'s `"scripts"` block first, same as the npm adapter. |
| `never_auto_list` | Empty by default. A repo's own `.claude/rules/dependencies.md` is authoritative. |

## Notes for adapter authors

- Confirm Yarn major version before trusting any command here — this
  adapter is Classic-only. A Berry repo needs its own adapter
  (`yarn-berry.md`, not written yet) with different commands.
- `yarn outdated`'s `{type, data: {head, body}}` table envelope is the
  single most likely parsing bug for a script consuming this adapter — it's
  a row-array shape, not per-package objects like npm/pnpm produce. Call
  this out explicitly if `fetch_updates.py` is extended to parse Yarn's
  output for real.
