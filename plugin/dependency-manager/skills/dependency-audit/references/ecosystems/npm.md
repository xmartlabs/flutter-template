# npm adapter

Worked example for an npm-managed JS/TS project (`package.json` +
`package-lock.json`) — covers any framework built on npm, React included;
the framework itself is just an ordinary dependency in `package.json`, not a
separate ecosystem.

| Slot | Value |
|---|---|
| `detect` | `package.json` with `package-lock.json` present alongside it (not `yarn.lock` or `pnpm-lock.yaml` — those mean `yarn.md`/`pnpm.md` instead). |
| `manifests` | `package.json`. In an npm workspaces monorepo, the root `package.json` plus every workspace member's own `package.json` listed under `"workspaces"`. |
| `lockfile` | `package-lock.json`. |
| `outdated_cmd` | `npm outdated --json` — note its exit code is nonzero when outdated packages exist (that's success for this purpose, not a failure); treat a nonzero exit as real failure only if stdout isn't valid JSON. |
| `install_cmd` | `npm install`. |
| `registry_api` | npm registry: `GET https://registry.npmjs.org/<name>` — returns full version history, `dist-tags`, and per-version metadata (including `deprecated` when a version is deprecated). |
| `advisory_source` | OSV.dev, ecosystem `npm`. npm also has a native `npm audit --json`, which is redundant with OSV.dev here but worth cross-checking if OSV.dev returns nothing and the package looks suspicious. |
| `changelog_convention` | No single hosted convention. Check the registry response's `repository` field for a GitHub URL, then look for `CHANGELOG.md` at that repo's root or its GitHub Releases page — most well-maintained npm packages have one of the two. |
| `version_scheme` | Semver, standard — npm enforces this more strictly than pub/PyPI, so no build-suffix stripping is normally needed. |
| `post_update_hooks` | None by default. If the project runs codegen (e.g. GraphQL codegen, a build step keyed off `package.json`), note it explicitly in this repo's own copy of this adapter. |
| `verification_cmd` | Check `package.json`'s own `"scripts"` block first (`npm run test`, `npm run lint`, `npm run build` — or a combined `npm run ci`/`npm run check` script if one exists) before inventing a raw invocation; that's almost always what CI actually runs. |
| `never_auto_list` | Empty by default. A repo's own `.claude/rules/dependencies.md` is authoritative — common candidates to add: a codegen-driving package (GraphQL codegen, Prisma), or the framework's own major version (e.g. `react`, `next`) if the repo wants that gated like a toolchain bump. |

## Notes for adapter authors

- `npm outdated`'s `wanted` field (max version satisfying the current
  semver range) and `latest` field (registry's `latest` dist-tag) are both
  useful: `wanted` is what a plain `npm update` would give you with no
  manifest edit, `latest` is what requires editing `package.json` — surface
  both the same way `dart-flutter.md`'s `upgradable`/`latest_compatible`
  distinction does.
- A monorepo using npm workspaces needs `manifests` to list every member
  package explicitly — `npm outdated` run at the root does cover workspace
  packages by default, but confirm that against the actual repo rather than
  assuming.
