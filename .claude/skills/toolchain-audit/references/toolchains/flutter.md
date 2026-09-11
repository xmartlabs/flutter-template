# Flutter/Dart SDK toolchain adapter

Covers the Flutter SDK, the bundled Dart SDK, and the Android build tooling
that ships alongside a Flutter bump in this repo (AGP, Kotlin, Gradle
wrapper) — these move together in practice (see the worked example below), so
this one adapter audits all four rather than splitting Android tooling out.

## `detect`

`.fvmrc` at repo root (FVM-pinned Flutter). `pubspec.yaml`'s `environment:`
block confirms the Dart constraint and mirrors the Flutter version.
`android/settings.gradle` and `android/gradle/wrapper/gradle-wrapper.properties`
confirm Android build tooling is present (always true for this template).

## `version_file(s)`

- `.fvmrc` — `flutter` key. Current: `3.32.7`.
- `pubspec.yaml` — `environment.sdk` (Dart constraint, currently
  `">=3.0.0 <4.0.0"`) and `environment.flutter` (currently `3.32.0`, a
  lower-bound advisory pin — keep it `<=` the `.fvmrc` value, don't drift).
- `android/settings.gradle` — `com.android.application` (AGP, currently
  `8.9.2`) and `org.jetbrains.kotlin.android` (currently `1.8.21`) plugin
  versions.
- `android/gradle/wrapper/gradle-wrapper.properties` — `distributionUrl`
  (Gradle wrapper, currently `8.11.1`).

## `latest_version_source`

- Flutter: https://docs.flutter.dev/release/archive (stable channel releases)
  or `flutter --version`/`fvm releases` output against the stable channel.
- Dart: bundled with each Flutter stable release — don't check independently;
  read the Dart version a candidate Flutter release ships from its release
  notes.
- AGP: https://developer.android.com/build/releases/gradle-plugin
- Kotlin: https://kotlinlang.org/docs/releases.html
- Gradle: https://gradle.org/releases/

## `migration_guide_source`

- Flutter: https://docs.flutter.dev/release/breaking-changes (breaking-change
  index) plus per-version release notes at
  https://docs.flutter.dev/release/release-notes — Flutter does not publish a
  single linear migration guide; treat the breaking-changes index entries
  between the current and target version as the migration steps.
- AGP: https://developer.android.com/build/releases/gradle-plugin has an
  "AGP upgrade assistant" pointer per version; Android Studio's Upgrade
  Assistant is the tooling equivalent — since this project has no Android
  Studio project open in CI, treat the release notes' "Upgrade" section per
  version as the guide.
- Kotlin: https://kotlinlang.org/docs/whatsnew-eap.html and per-version
  compatibility guides at https://kotlinlang.org/docs/compatibility-guide.html
- Gradle: https://docs.gradle.org/current/userguide/upgrading_version_8.html
  (version-specific upgrade guides, one per major/minor line)

## `native_project_impacts`

Grounded in PR #221 (`chore/flutter-3.47.2`, `xmartlabs/flutter-template`,
Flutter 3.32.7 → 3.47.2), the actual diff of a past bump in this repo:

- `android/app/build.gradle` — `minSdkVersion 21` hardcoded value replaced
  with `minSdkVersion flutter.minSdkVersion` (newer Flutter's Gradle plugin
  wants the min SDK sourced from itself, not a literal).
- `android/gradle.properties` — new flags added by the Flutter migrator:
  `android.builtInKotlin=false`, `android.newDsl=false`.
- `android/settings.gradle` — AGP and Kotlin plugin versions must be bumped
  together with Flutter (AGP `8.9.2`→`8.13.2`, Kotlin `1.8.21`→`2.2.21` in
  #221) — a Flutter bump alone without these will fail Gradle sync.
- `android/gradle/wrapper/gradle-wrapper.properties` — Gradle wrapper must be
  bumped to match the new AGP's minimum-supported Gradle version (`8.11.1`→
  `8.14.3` in #221).
- `android/.gitignore` — new `/build/` entry added (newer Flutter/Gradle
  layout emits a build dir not previously ignored).
- `analysis_options.yaml` (root, `design_system/`,
  `design_system/design_system_gallery/`) — new `analyzer.exclude` entries for
  `build/`, `android/`, `ios/`, `web/` (newer Flutter's tooling generates
  analyzable-looking files under these dirs that must be excluded).
- Every `.dart` file gets reformatted (no logic changes) because `dart
  format`'s output shape changes between Dart SDK versions — expect a
  repo-wide formatting-only diff; do not treat this as a real behavior change,
  but do run `./scripts/checks.sh`'s `dart format` check to catch it.
- `scripts/project_setup.sh` reruns `flutter_flavorizr`,
  `flutter_launcher_icons`, and `flutter_native_splash` against the native
  Android/iOS projects — re-run it after a Flutter bump if any of those
  generators' output format changed for the new SDK (check their own
  changelogs; this is a package-level concern the package pipeline should
  flag if their pins move independently).
- iOS-side impacts (Xcode project settings, `Podfile` lock) were not exercised
  by #221's diff since it only touched Android files.
  <!-- OPEN QUESTION: does a Flutter bump ever require ios/ project regeneration in this template? #221 shows no iOS diff, but that may just mean this bump didn't cross an iOS-relevant threshold. -->

## `ci_impacts`

- `.github/workflows/flutter-ci.yml` installs FVM/Flutter directly
  (`dart pub global activate fvm --verbose && fvm install --verbose && fvm
  use --force --verbose`) and reads `.fvmrc`, so it self-updates once
  `.fvmrc` is bumped — no workflow YAML edit needed for the Flutter version
  itself.
- `.github/workflows/actions/flutter-setup/action.yml` pins the FVM CLI
  version itself via the `vars.FVM_VERSION` GitHub Actions variable
  (`dart pub global activate fvm ${{ vars.FVM_VERSION }}`) — a Flutter SDK
  bump does not require bumping this, but an FVM CLI bump would, and that
  variable lives in repo/org settings, not in a tracked file.
- `vars.JAVA_VERSION` (consumed by both `flutter-ci.yml` directly and by
  `flutter-setup/action.yml`) may need to move up if the new AGP/Kotlin
  combination requires a newer JDK — check the AGP release notes' JDK
  requirement for the target version.
  <!-- OPEN QUESTION: PR #221's diff (as fetched) didn't include a workflow or vars change, so the actual JAVA_VERSION requirement for AGP 8.13.2/Kotlin 2.2.21 in this repo's CI is unverified — flag this for manual check against https://developer.android.com/build/releases/gradle-plugin's JDK table. -->
- `.github/workflows/flutter-ci.yml`'s `dart-lang/setup-dart@v1.4` step
  pins its own Dart action version, independent of the Flutter-bundled Dart
  version — not affected by a Flutter bump.

## `verification_cmd`

`./scripts/checks.sh` (sorts ARB, checks `dart format`, `flutter analyze`
across all three pubspecs, `dart_code_linter:metrics`, `flutter test`) — the
same gate `.claude/rules/dependencies.md` names as the required verification
gate, and what CI's `flutter-ci.yml` runs. For a toolchain bump also run
`fastlane android build_dev_debug_apk` (mirrors the CI `Build android app`
step) since Gradle/AGP/Kotlin changes are only exercised by an actual native
build, not by `flutter analyze`/`flutter test` alone.

## Worked example

PR #221 (`chore/flutter-3.47.2`) is the concrete precedent for what a Flutter
SDK bump's blast radius looks like in this repo: one version-file edit
(`.fvmrc`) cascaded into 3 Android build-file edits, 1 new `.gitignore`
entry, 4 `analysis_options.yaml` edits, and a repo-wide `dart format`
reformat — with zero CI workflow edits and zero iOS edits. Use this shape
(small pin diff, large native/lint-config diff, no logic diff) as the
expected pattern when summarizing a candidate's `breaking_changes`.
