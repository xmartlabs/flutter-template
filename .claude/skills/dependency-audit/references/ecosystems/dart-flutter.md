# Dart/Flutter adapter

Filled-in instance of `_template.md` for this repo (`xmartlabs/flutter-template`).
Its machine-readable sibling, `dart-flutter.json`, is what
`scripts/fetch_updates.py` actually reads — keep both in sync.

| Slot | Value |
|---|---|
| `detect` | `pubspec.yaml` present at the repo root. |
| `manifests` | Three packages, all audited and updated together per `.claude/rules/dependencies.md`: `pubspec.yaml` (root app), `design_system/pubspec.yaml`, `design_system/design_system_gallery/pubspec.yaml`. |
| `lockfile` | `pubspec.lock`, but **not uniformly present**: confirmed on disk at `pubspec.lock` (root) and `design_system/design_system_gallery/pubspec.lock`. `design_system/pubspec.lock` does **not** exist on disk — `design_system` is a library package (consumed via a `path:` dependency, never run standalone), so its lockfile isn't committed. Don't expect or diff a `design_system/pubspec.lock`. |
| `outdated_cmd` | `fvm flutter pub outdated --json`, run once per manifest directory (root, `design_system/`, `design_system/design_system_gallery/`). JSON output gives current/upgradable/resolvable/latest per package plus whether it's a dev dependency. |
| `install_cmd` | `fvm flutter pub get`, run once per manifest directory. This mirrors the Fastfile's `fetch_dependencies` lane (`fastlane/Fastfile`), which runs `fvm flutter pub get --suppress-analytics` in the root and again in `design_system/design_system_gallery` (it does not re-run in `design_system/` directly — `pub get` on the root and on the gallery each resolve `design_system` as a path dependency). `pub get` itself does not mutate manifests; it only resolves/writes lockfiles, so it's safe to use for read-only inventory purposes too. |
| `registry_api` | pub.dev's public package API: `GET https://pub.dev/api/packages/<name>` — returns the full version list and metadata (including `retracted`, `published`, `pubspec`) as JSON. Use this to enumerate what's available beyond what `pub outdated` reports (e.g. prereleases, retraction status). |
| `advisory_source` | OSV.dev, ecosystem `Pub`. Query `POST https://api.osv.dev/v1/query` with body `{"package": {"name": "<name>", "ecosystem": "Pub"}, "version": "<version>"}` per package to get known vulnerabilities for the currently-pinned version. |
| `changelog_convention` | `https://pub.dev/packages/<name>/changelog` — pub.dev renders each package's `CHANGELOG.md` at this stable URL. |
| `version_scheme` | Semver, but pub.dev packages commonly append a build-number suffix (e.g. `5.4.3+1`, `4.9.0+1`) that is not part of semver precedence — strip/ignore the `+N` suffix when comparing versions or classifying a bump as patch/minor/major; don't treat a build-number-only change as a semver bump. |
| `post_update_hooks` | `fvm dart run build_runner build --delete-conflicting-outputs` — only needed when a codegen-driving package (see `never_auto_list` below) or one of its consumers' annotated sources changes; it is not run after every dependency bump. `scripts/clean_up.sh` runs the equivalent as part of a full clean rebuild. |
| `verification_cmd` | `./scripts/checks.sh` — the canonical gate (sorts `intl_en.arb`, `dart format`, `flutter analyze` across root + `design_system` + `design_system/design_system_gallery`, `dart_code_linter:metrics`, `flutter test`). Prefer this over hand-rolled `flutter analyze`/`flutter test` invocations. |
| `never_auto_list` | See `.claude/rules/dependencies.md` "Never-auto-update list" — authoritative, don't repeat it here. It currently covers the `freezed`/`build_runner`/`json_serializable`/`auto_route` codegen family plus `flutter_gen_runner`. |

## Notes specific to this repo

- **Exact-pin style**: every dependency in all three manifests is pinned to an exact version (`dio: 5.4.3+1`, not `^5.4.3`). When a later pipeline stage proposes a bump, it must replace the exact pin with a new exact pin — never loosen to a range. See `.claude/rules/dependencies.md` "Pin style".
- **`dependency_overrides` standing finding**: root `pubspec.yaml` carries a `dependency_overrides` block (`file: 7.0.0`, `pub_updater: 0.4.0`) under a `## TODO remove this when dart_code_linter updates the dependencies` comment. `dependency-audit` must surface this every run as an open finding, not silently include or drop it — it's a known workaround, not a candidate to bump normally.
- **Toolchain vs. package**: the Flutter SDK version (`.fvmrc`) and Android build tooling (AGP/Kotlin/Gradle wrapper) are explicitly out of scope for this adapter — `toolchain-audit` owns those per `.claude/rules/dependencies.md`.

<!-- OPEN QUESTION: CLAUDE.md was not present on this worktree's checked-out `main` branch at authoring time (git history shows it added in commit d645154 on branch `chore/flutter-3.47.2`, not yet merged to `main`). The commands above (`fvm flutter pub get`, `fvm dart run build_runner build --delete-conflicting-outputs`, `./scripts/checks.sh`) were verified against that commit's CLAUDE.md content plus `scripts/checks.sh` and `fastlane/Fastfile` on disk, which are consistent with it. If CLAUDE.md lands on `main` with different wording before this pipeline ships, re-check this adapter against it. -->
