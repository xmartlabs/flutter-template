# Flutter/Dart SDK toolchain adapter

Covers the Flutter SDK, the bundled Dart SDK, and the Android build tooling
that typically ships alongside a Flutter bump (AGP, Kotlin, Gradle wrapper) —
these move together in practice (see the worked example below), so this one
adapter audits all four rather than splitting Android tooling out. Written to
be reusable as-is by any FVM-managed Flutter project; the concrete version
numbers below are this repo's current pins and should stay in sync via
`dependency-doc-sync` whenever a toolchain bump lands — treat a stale number
here as a doc-sync gap to report, not a reason to guess.

## `detect`

`.fvmrc` at repo root (FVM-pinned Flutter). `pubspec.yaml`'s `environment:`
block confirms the Dart constraint and mirrors the Flutter version.
`android/settings.gradle` and `android/gradle/wrapper/gradle-wrapper.properties`
confirm Android build tooling is present (standard for any Flutter project
targeting Android).

## `version_file(s)`

- `.fvmrc` — `flutter` key. Current: `3.47.2`.
- `pubspec.yaml` — `environment.sdk` (Dart constraint, currently
  `">=3.8.0 <4.0.0"`) and `environment.flutter` (currently `3.47.2`, a
  lower-bound advisory pin — keep it `<=` the `.fvmrc` value, don't drift).
- `android/settings.gradle` — `com.android.application` (AGP, currently
  `8.13.2`) and `org.jetbrains.kotlin.android` (currently `2.2.21`) plugin
  versions.
- `android/gradle/wrapper/gradle-wrapper.properties` — `distributionUrl`
  (Gradle wrapper, currently `8.14.3`).

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
  Assistant is the tooling equivalent when a native IDE project is open.
- Kotlin: https://kotlinlang.org/docs/whatsnew-eap.html and per-version
  compatibility guides at https://kotlinlang.org/docs/compatibility-guide.html
- Gradle: https://docs.gradle.org/current/userguide/upgrading_version_8.html
  (version-specific upgrade guides, one per major/minor line)

## `native_project_impacts`

A Flutter/AGP/Kotlin/Gradle bump commonly touches, beyond the version files
themselves (verify each against this repo's actual diff when a bump lands —
don't assume all apply every time):

- `android/app/build.gradle` — a hardcoded `minSdkVersion <N>` may need to
  become `minSdkVersion flutter.minSdkVersion` if a newer Flutter Gradle
  plugin expects the min SDK sourced from itself rather than a literal.
- `android/gradle.properties` — the Flutter migrator can add new flags here
  (e.g. `android.builtInKotlin`, `android.newDsl`) when the AGP/Kotlin
  combination changes.
- `android/settings.gradle` — AGP and Kotlin plugin versions generally need
  to move together with Flutter; a Flutter bump alone without them will fail
  Gradle sync.
- `android/gradle/wrapper/gradle-wrapper.properties` — the Gradle wrapper
  typically needs bumping to at least the new AGP's minimum-supported Gradle
  version.
- `android/.gitignore` — a newer Flutter/Gradle layout can start emitting a
  build directory that wasn't previously ignored.
- Every generated-analysis config (e.g. each package's `analysis_options.yaml`
  if the repo has more than one Dart package) may need new `analyzer.exclude`
  entries for build/native output directories that a newer toolchain starts
  generating.
- Every `.dart` file can get a formatting-only diff, because `dart format`'s
  output shape changes between Dart SDK versions — expect a repo-wide
  reformat with no logic change, and confirm that's *all* it is via the
  project's format check rather than assuming.
- Any post-bump native-project regeneration scripts this repo defines (icon/
  splash/flavor generators, etc.) may need re-running if their own output
  format changed for the new SDK — check their changelogs; that's a
  package-level concern the package pipeline should flag if their pins move
  independently of the toolchain bump.
- iOS-side impacts (Xcode project settings, `Podfile` lock) should be checked
  independently — an Android-only diff on one bump doesn't mean a future bump
  won't touch iOS.

## `ci_impacts`

- If CI installs the Flutter SDK via FVM and reads `.fvmrc` (a common
  pattern), the workflow self-updates once `.fvmrc` is bumped — no workflow
  YAML edit needed for the Flutter version itself. Confirm this repo's actual
  CI setup rather than assuming.
- A separate FVM CLI version pin (if the workflow uses one, often via a
  repo/org-level variable) is independent of the Flutter SDK version — a
  Flutter bump doesn't require bumping it, but an FVM CLI bump would.
- A JDK version pinned for CI (directly or via a variable) may need to move
  up if the new AGP/Kotlin combination requires a newer JDK — check the AGP
  release notes' JDK requirement for the target version.
- A Dart-setup CI action (if used) pins its own version independent of the
  Flutter-bundled Dart version — not affected by a Flutter bump.

## `verification_cmd`

This project's canonical verification command as named in
`.claude/rules/dependencies.md`'s verification gate — typically a script that
runs format/analyze/lint checks and the test suite across every Dart package
in the repo. For a toolchain bump, also run a real native build (an
Android debug build at minimum) since Gradle/AGP/Kotlin changes are only
exercised by an actual native build, not by static analysis or unit tests
alone.

## Worked example

A Flutter SDK bump's blast radius commonly looks like this: one version-file
edit (`.fvmrc`) cascades into a handful of Android build-file edits (AGP/
Kotlin plugin versions, a `minSdkVersion` reference, new Gradle properties
flags), a Gradle-wrapper bump to match AGP's minimum-supported version, one
or two new `.gitignore`/`analyzer.exclude` entries for newly-generated build
output, and a repo-wide `dart format` reformat with no logic changes — often
with zero CI workflow edits and zero iOS edits, though that varies by repo
and by how far the bump jumps. Use this shape (small pin diff, larger native/
lint-config diff, no logic diff) as the expected pattern when summarizing a
real candidate's `breaking_changes`, and replace it with this repo's actual
diff once a real bump has been audited here — a genuine prior diff is always
better evidence than this illustrative shape.
