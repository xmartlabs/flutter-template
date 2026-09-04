# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

This project uses [FVM](https://fvm.app) to pin the Flutter SDK version (see `.fvmrc`). Prefix Flutter/Dart commands with `fvm` (e.g. `fvm flutter ...`, `fvm dart ...`).

Day-to-day commands:

```bash
# Install dependencies
fvm flutter pub get

# Run a single test file
fvm flutter test test/cubits/signin_cubit_test.dart

# Run a single test by name
fvm flutter test --plain-name "test description"

# Regenerate code (freezed, json_serializable, auto_route, asset gen)
fvm dart run build_runner build --delete-conflicting-outputs
```

Everything else — formatting, static analysis, linting, full test runs, code (re)generation, native project setup — is driven by the scripts in `scripts/`, which are also what CI and the pre-push hook run, so prefer them over reinventing the equivalent `fvm flutter`/`fvm dart` invocation by hand:

- `./scripts/checks.sh` — sorts `lib/l10n/intl_en.arb`, checks `dart format`, runs `flutter analyze` (root + `design_system` + `design_system/design_system_gallery`), runs `dart_code_linter:metrics` (style/performance/warnings + unused-code), then `flutter test`. This is what `.github/hooks/pre-push` and `flutter-ci.yml` run — see `.claude/rules/workflows.md`.
- `./scripts/clean_up.sh` — `flutter clean` + `pub get` + `build_runner build --delete-conflicting-outputs`, for when generated code needs a clean rebuild.
- `./scripts/project_setup.sh` — reruns `flutter_flavorizr`, `flutter_launcher_icons`, and `flutter_native_splash` to regenerate native (Android/iOS) project files after editing their config in `pubspec.yaml` (flavor names/ids, icons, splash screen).

Pre-push hooks live in `.github/hooks`; enable them once per clone with `git config core.hooksPath .github/hooks`.

### Flavors

The app has three flavors — `dev`, `staging`, `prod` — generated into the native Android/iOS projects by `flutter_flavorizr` (config in `pubspec.yaml`, applied via `./scripts/project_setup.sh`; see e.g. the `productFlavors` block in `android/app/build.gradle`). Running/building **must** target one:

```bash
fvm flutter run --flavor dev --dart-define=ENV=dev
```

The `--dart-define=ENV=<flavor>` must match `--flavor` — `Config` (`lib/core/common/config.dart`, `Environments` enum in `lib/core/common/environments.dart`) reads the `ENV` define to decide which `environments/<flavor>.env` file to load (falling back to `dev` if unset). Check `lib/core/common/environments.dart` for the current list of valid flavor names before running/building.

## Guidelines

- The app is split into two independent parts: the main app under `lib/` (screens + data layer), and a local package, **`design_system/`** (referenced via a `path:` dependency in `pubspec.yaml`), which holds all shared theming/widgets and ships its own gallery app (`design_system/design_system_gallery`) plus its own tests/analysis. Treat `design_system/` as an independent package — run its tests/analyze separately, don't reach into it from `lib/` beyond its public exports. See `.claude/rules/design-system.md` for its conventions.
- Environment variables are loaded via `flutter_dotenv` from files in `environments/`: `default.env` provides defaults for all environments, `<env>.env` overrides per environment, and `<env>.private.env` holds private/untracked values for that environment.

## Architecture

This is a Flutter Bloc (Cubit) app split into two top-level areas under `lib/`:

- **`lib/ui/`** — screens and presentation logic.
- **`lib/core/`** — models and the data layer.

### UI layer

- Each feature/section lives in its own folder under `lib/ui/<section>/` with three files following a `<name>_screen.dart` / `<name>_cubit.dart` / `<name>_state.dart` convention (e.g. `lib/ui/signin/`). The screen is a `StatelessWidget`; state is managed by a `Cubit` (flutter_bloc), with state classes generated via `freezed` (`part '<name>_cubit.freezed.dart'`, `part '<name>_state.dart'`).
- `lib/ui/main/` — `MainScreen`, which sets up `MaterialApp` and hosts the app router.
- `lib/ui/router/` — the app router, built with `auto_route`. It has two subgraphs: `UnauthenticatedRouter` and `AuthenticatedRouter`, gated by auth state.
- `lib/ui/section/error_handler/` — `GlobalEventHandlerCubit`, a shared cubit for surfacing errors/events app-wide; screens/cubits report failures to it (see `filterSuccess(_globalEventHandler.handleError)` pattern below).

### Core layer (data)

- `lib/core/model/` — domain models (freezed/json_serializable). Separate `db`/`service` subfolders can hold storage- or network-specific model variants when a model needs to differ per layer (`lib/core/model/service/` holds API-shaped models like `service_response.dart`).
- `lib/core/repository/` — the repository pattern (e.g. `session_repository.dart`, `project_repository.dart`). Repositories are the single API cubits use to reach data; they compose one or more data sources.
- `lib/core/source/` — data sources consumed by repositories, split into `*_local_source.dart` (cache/local storage) and `*_remote_source.dart` (REST API via `dio`). `lib/core/source/common/` holds shared source infra (`http_service.dart`, `auth_interceptor.dart`, Hive/shared_preferences storage wrappers).
- `lib/core/di/` — `get_it`-based dependency injection, split into modules run in order at startup from `DiProvider.init()`: `AppProvidersModule` (must run first), `UtilsDiModule`, `RepositoryDiModule`. Cubits/repositories pull dependencies via `DiProvider.get<T>()` rather than constructor injection from the widget tree in most cases (see `SignInCubit`'s `SessionRepository _sessionRepository = DiProvider.get();`).
- `lib/core/common/` — cross-cutting extensions, helpers, and stores (e.g. `stream_future_extensions.dart` providing the `filterSuccess` combinator used to route repository call failures to `GlobalEventHandlerCubit`).

### Code generation

Freezed, json_serializable, auto_route, and asset/localization generation (`flutter_gen`) all run through `build_runner`, configured in `build.yaml`. Generated files (`*.freezed.dart`, `*.g.dart`, `*.gen.dart`, `*.gr.dart`) are excluded from analysis and should not be hand-edited.

## Testing

There are two kinds of tests: unit/widget/cubit tests under `test/` (mirroring the core/UI layers, e.g. `test/repositories/`, `test/mocks/`, `test/cubits/`, `test/common/`), and end-to-end tests under `integration_test/` using the `integration_test` package. `mocktail` is used for mocking. See `.claude/rules/testing.md` for detailed conventions.

## CI/CD

GitHub Actions workflows under `.github/workflows/` handle CI and deployment. See `.claude/rules/workflows.md` for how they work and their conventions.
