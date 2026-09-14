---
paths:
  - ".github/workflows/**"
  - ".github/hooks/**"
---

# CI/CD workflows

## Workflows (`.github/workflows/*.yml`)

- **`flutter-ci.yml`** ("Flutter CI") — triggers on every `pull_request` and on `push` to `main`. Runs on `macos-latest`. Checks out, sets up Java (`vars.JAVA_VERSION`, zulu distribution) + Dart + Flutter (`subosito/flutter-action@v2`, stable channel), caches FVM (`/home/runner/fvm/versions/`, keyed on `fvm_config.json` hash) and the pub cache, installs FVM/Flutter, sets up Ruby (`ruby/setup-ruby@v1`, bundler-cache), activates `arb_utils 0.8.3`, then runs fastlane lanes via `maierj/fastlane-action@v3.0.0`: `fetch_dependencies` → `lints` → `ensure_no_change_in_generated_code` → `tests` → `android build_dev_debug_apk` (with `APP_ENV: 'dev'`, subdirectory `android`). Note: this workflow does its own inline setup rather than reusing the composite `flutter-setup`/`android-setup` actions — new CI steps should still prefer the composite actions where possible.

- **`flutter-staging-cd.yml`** ("Flutter Staging CD") — triggers only on `pull_request` targeting `staging` with `types: [closed]`, gated further by `if: github.event.pull_request.merged == true` (i.e. runs only when a PR into `staging` is actually merged, not just closed). Job `calculate_build_number` (ubuntu-latest) downloads the Firebase service account (base64 secret decoded to a JSON file) and runs `bundle exec fastlane get_next_build_number`, parsing `Next Build Number: N` out of the output and failing (`exit 1`) if it isn't numeric; exposes it as job output `build_number`. Two dependent jobs then run in parallel, each `needs: [calculate_build_number]`: `build_and_release_ios_staging_firebase` (macos-13, 20 min timeout) calls the `deploy-ios-firebase` composite action; `build_and_release_android_staging_firebase` (ubuntu-latest, 20 min timeout) calls `deploy-android-firebase`. Both set `APP_ENV: "staging"` and pull the Firebase App ID / tester groups from placeholder env vars at the top of the file (`FIREBASE_APP_ID_STAGING`, `FIREBASE_TESTER_GROUPS`) that must be filled in per-project.

- **`flutter-production-cd.yml`** ("Flutter Production CD") — same trigger pattern as staging but for PRs merged into `main`. Job `calculate_build_number` (30 min timeout) is identical in structure to the staging one. Then `build_and_release_testflight` (macos-13, 30 min) calls `deploy-ios-testflight`, and `build_and_release_google_play` (ubuntu-latest, 30 min) calls `deploy-android-google-play` with `APP_ENV: 'prod'`. Unlike staging, production ships to TestFlight/Google Play rather than Firebase App Distribution.

- **`pr-title-checker.yml`** ("PR Title Checker") — triggers on `pull_request_target` for `opened`, `edited`, `synchronize`, `labeled`, `unlabeled`. Runs `thehanimo/pr-title-checker@v1.4.0` against `.github/pr-title-checker-config.json`, which requires PR titles to start with one of `fix: `, `feat: `, `docs: `, `refactor: `, `test: `, `chore: ` (matching the Conventional-Commits-style prefixes also used in this repo's own commit messages), applies a "Title needs formatting" label on failure, and is skipped for PRs labeled `meta`.

`.github/workflows/README.md` contains a short human-maintained summary of each workflow plus the list of repository secrets each CD workflow requires (Google Play service account, Firebase service account, iOS distribution certificate + password, App Store Connect API key parts) — keep it in sync when workflow inputs/secrets change.

## Composite actions (`.github/workflows/actions/*/action.yml`)

New workflow steps should reuse these instead of re-implementing setup/deploy logic inline (as `flutter-ci.yml` currently does):

- **`flutter-setup`** — shared Flutter/Dart/Ruby setup: Java (`vars.JAVA_VERSION`), Dart, caches `/Users/runner/fvm/` and `/Users/runner/.pub-cache/`, installs FVM (`vars.FVM_VERSION`) and activates it via `fvm install`/`fvm use --force`, sets up Ruby/bundler at repo root and (conditionally, via `setup-android`/`setup-ios` boolean inputs) inside `vars.ANDROID_APP_FOLDER` / `vars.IOS_APP_FOLDER`, then runs the fastlane `fetch_dependencies` lane. Requires `FVM_VERSION`, `JAVA_VERSION`, `ANDROID_APP_FOLDER`, `IOS_APP_FOLDER` to be set as GitHub Actions variables.
- **`android-setup`** — checks out (`fetch-depth: 15`), calls `flutter-setup` with `setup-android: true`, then decodes the base64 Android keystore (`secrets.ANDROID_KEYSTORE_BASE_64_CONTENT`) and key.properties (`secrets.ANDROID_KEY_PROPERTIES_BASE_64`) into the android app folder, naming the keystore file from `vars.ANDROID_KEYSTORE_NAME`. Requires `ANDROID_KEYSTORE_NAME` as a repo variable.
- **`ios-setup`** — checks out (`fetch-depth: 15`), selects the Xcode version via `sudo xcode-select -s /Applications/Xcode_${{ vars.XCODE_VERSION }}.app/...`, calls `flutter-setup` with `setup-ios: true`, then decodes the base64 distribution certificate into the iOS app folder, named from `vars.IOS_CERTIFICATE_NAME`. Requires `XCODE_VERSION` and `IOS_CERTIFICATE_NAME` as repo variables.
- **`deploy-android-firebase`** — calls `android-setup` (referenced internally as `./.github/workflows/actions/setup-android`), decodes the Firebase service account into the android folder, then runs the fastlane `deploy_firebase_app_distribution` lane with `APP_ENV`/`BUILD_NUMBER`/`FIREBASE_SERVICE_ACCOUNT_FILE`/`FIREBASE_APP_ID`/`FIREBASE_TESTER_GROUPS` env vars.
- **`deploy-android-google-play`** — calls `android-setup`, then runs the fastlane `publish_prod_google_play` lane with `GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS_CONTENT`/`BUILD_NUMBER`/`APP_ENV`.
- **`deploy-ios-testflight`** — calls `ios-setup` (referenced internally as `./.github/workflows/actions/setup-ios`), then runs the fastlane `publish_prod_testflight` lane with the App Store Connect API key pieces, distribution cert path/password, `FIREBASE_APP_ID`, `BUILD_NUMBER`.
- **`deploy-ios-firebase`** — calls `ios-setup`, decodes the Firebase service account into the iOS folder, then runs the fastlane `deploy_firebase_app_distribution` lane with the same App Store Connect/cert vars plus `FIREBASE_APP_ID`/`FIREBASE_TESTER_GROUPS`.

**Known issue to watch for**: several of these composite actions currently reference each other by the wrong path/name — e.g. `deploy-android-firebase` and `deploy-android-google-play` use `uses: ./.github/workflows/actions/setup-android` (actual directory is `android-setup`), `deploy-ios-testflight` and `deploy-ios-firebase` use `./.github/workflows/actions/setup-ios` (actual directory is `ios-setup`), and `android-setup`/`ios-setup` reference `./.github/workflows/actions/flutter_setup` (actual directory is `flutter-setup`, hyphen not underscore). The `runs:` blocks in `android-setup`, `ios-setup`, `deploy-android-firebase`, `deploy-android-google-play`, `deploy-ios-testflight`, and `deploy-ios-firebase` also indent `steps:` one level under `using: "composite"` incorrectly (it should be a sibling key, not nested under the string value) — check actual GitHub Actions run behavior before assuming these files work as-is; when adding a new workflow, fix the path or indentation rather than copying it forward.

## Conventions

- FVM/Flutter setup is always: activate FVM globally via `dart pub global activate fvm`, then `fvm install --verbose && fvm use --force --verbose`, driven off `fvm_config.json`. Two separate caching schemes exist across files: `flutter-ci.yml` caches `/home/runner/fvm/versions/` (Linux runner path) while `flutter-setup` (used by macOS release jobs) caches `/Users/runner/fvm/` — match the cache path to the runner OS when adding new jobs.
- Java version, FVM version, Android/iOS app folder names, Android keystore name, iOS certificate name, and Xcode version are never hardcoded — they come from GitHub Actions **variables** (`vars.*`), each flagged with an `# IMPORTANT: ... has to be set on github variables` comment at the top of the relevant file.
- Credentials (keystores, certificates, service accounts, API keys) are passed as base64-encoded GitHub **secrets** (`secrets.*`) and decoded on the runner with `echo -n $VAR | base64 -d > <path>`, never checked into the repo.
- Fastlane is invoked exclusively through `maierj/fastlane-action@v3.0.0`, with `lane:` naming the fastlane lane and `subdirectory:` pointing at `android` or `ios`.
- Build numbers for both CD workflows are computed once in a `calculate_build_number` job (via `fastlane get_next_build_number`) and passed to downstream jobs through `needs.calculate_build_number.outputs.build_number` — don't recompute it per-platform.
- CD workflows trigger on `pull_request` `closed` and immediately gate the actual work with `if: github.event.pull_request.merged == true`, since `closed` fires both for merges and for abandoned/closed-without-merge PRs.
- PR titles must use Conventional-Commit-style prefixes (`fix:`, `feat:`, `docs:`, `refactor:`, `test:`, `chore:`) enforced by `pr-title-checker.yml`; this mirrors the prefix style already used for commit messages in this repo.

## Pre-push hook (`.github/hooks/pre-push`)

A plain bash script (not installed by default — enabled per clone via `git config core.hooksPath .github/hooks`, documented in `README.md` and `CLAUDE.md`). On push it runs, in order:
1. `./scripts/checks.sh` — sorts `lib/l10n/intl_en.arb` with `arb_utils`, runs `fvm dart format --set-exit-if-changed lib`, `fvm flutter analyze .`, `dart_code_linter:metrics analyze lib` (fatal on style/performance/warnings), `dart_code_linter:metrics check-unused-code lib --fatal-unused`, then repeats the two `flutter analyze` checks against `design_system` and `design_system/design_system_gallery`, and finally `fvm flutter test`. Any failure calls `error()`, which prints in red and exits non-zero, aborting the push.
2. `fvm flutter test` — run a second time, directly, after `checks.sh` already ran it once.

This hook mirrors (a subset of) what `flutter-ci.yml` checks, so failures caught locally should also fail CI.
