---
paths:
  - "test/**"
  - "integration_test/**"
  - "test_driver/**"
---

# Testing conventions

## Directory structure

- `test/cubits/` — one `<name>_cubit_test.dart` per cubit, e.g. `signin_cubit_test.dart`,
  `welcome_cubit_test.dart`. Uses `bloc_test` and mocks the repositories the cubit
  depends on.
- `test/repositories/<feature>/` — one folder per feature (e.g. `project/`, `session/`),
  containing three kinds of tests per feature:
  - `<feature>_repository_test.dart` — tests the repository, mocking its local/remote sources.
  - `<feature>_local_source_test.dart` — tests the local data source (Hive-backed DAO or
    local-storage wrapper), using a real Hive instance initialized in a temp dir, or a
    mocked storage dependency (e.g. `LocalSharedPreferencesStorageMock`).
  - `<feature>_remote_source_test.dart` — tests the remote data source, mocking `HttpService`.
- `test/mocks/` — app-bootstrap test doubles used by widget tests, not by unit tests:
  - `mock_app.dart` — `SimpleTesteableApp`, a `MyApp` subclass with a static
    `getUnauthenticatedApp(...)` factory that boots the app with DI, fake local
    sources/services, and optional API/data overrides, for use in widget tests.
  - `mocks/services/` — fakes for platform services (`FakeHttpService` — a mocktail
    `Mock implements HttpServiceDio` extended with a `mockApi()` helper that stubs
    GET/POST/PUT/DELETE by path; `FakePathProviderPlatform` — a `Fake` implementing
    `PathProviderPlatform` with hardcoded path constants).
  - `mocks/sources/` — fakes for local sources (`FakeFlutterSecureStorage`, which just
    forwards to `FlutterSecureStorage.setMockInitialValues`).
- `test/common/` — shared test utilities imported by cubit and repository tests
  (imported as `../common/...` or `../../common/...` depending on nesting depth):
  - `cubit_mocks.dart` — mocktail `MockCubit<State>` subclasses for cubits consumed
    by other cubits/screens (e.g. `MockGlobalEventHandlerCubit`).
  - `data_mocks.dart` — mocktail `Mock`-based doubles for services, data sources, and
    repositories (`HttpServiceMock`, `ProjectLocalSourceMock`, `ProjectRemoteSourceMock`,
    `AuthLocalSourceMock`, `AuthRemoteSourceMock`, `LocalSharedPreferencesStorageMock`,
    `MockSessionRepository`, `MockProjectRepository`).
  - `general_helpers.dart` — small generic test helpers: `successResponse(...)` builds a
    Dio `Response` from a list of encodable models, `initHive()`/`closeHive()` set up and
    tear down a temp-dir-backed Hive instance for tests that exercise real local storage.
  - `project_helpers.dart` — model factories, e.g. `generateProjects(count)` to build a
    list of fake `Project`s with deterministic fields.
- `test/widget_test.dart` — top-level app smoke test, uses `mocks/mock_app.dart`.

## Naming

- Test files are named `<subject>_test.dart` and placed to mirror the concept under
  test rather than the exact `lib/` path — e.g. cubit tests live under `test/cubits/`,
  repository/source tests are grouped by feature under `test/repositories/<feature>/`.
- Mock/fake classes are suffixed `Mock` (mocktail `Mock`, e.g. `MockSessionRepository`,
  `HttpServiceMock`) or prefixed `Fake`/`Mock` for `Fake`-based doubles
  (`FakeHttpService`, `FakePathProviderPlatform`, `FakeFlutterSecureStorage`).

## Mocking convention (mocktail)

- Mock classes extend mocktail's `Mock` and implement the abstraction being replaced,
  e.g.:
  ```dart
  class MockSessionRepository extends Mock implements SessionRepository {}
  class ProjectLocalSourceMock extends Mock implements ProjectLocalSource {}
  ```
  Repositories/sources/services are all mocked this way — one line per class, grouped
  under comments like `//* Services`, `//* Data sources`, `//* Repositories` in
  `test/common/data_mocks.dart`.
- Cubit dependencies-on-other-cubits use `MockCubit<State>` from `bloc_test` instead of
  plain `Mock`:
  ```dart
  class MockGlobalEventHandlerCubit extends MockCubit<GlobalEventHandlerState>
      implements GlobalEventHandlerCubit {}
  ```
- Platform interfaces that can't use `Mock` (no real method dispatch needed, or the
  interface has default no-op behavior) use `Fake` instead, e.g.
  `FakePathProviderPlatform extends Fake with MockPlatformInterfaceMixin implements
  PathProviderPlatform`.
- No `registerFallbackValue` calls were found in the current suite — arguments passed to
  stubbed methods are always concrete values or mocktail's `any()`/`any(named: ...)`
  matchers, not custom types that would require a fallback registration.
- DI: cubit and widget tests register mocks into `DiProvider.instance` (a `GetIt`
  instance) directly in `setUp`, and always call `getIt.reset()` in `tearDown`:
  ```dart
  setUp(() {
    getIt = DiProvider.instance
      ..registerSingleton<SessionRepository>(
        sessionRepository = MockSessionRepository(),
      );
  });
  tearDown(() => getIt.reset());
  ```
  Repository/source tests do not go through DI — they construct the class under test
  directly, passing in mocked constructor dependencies.

## Cubit testing convention (bloc_test)

- A `test()` (not `blocTest`) checks the cubit's initial state right after construction:
  ```dart
  test('Create SignInCubit should return base state', () {
    signInCubit = SignInCubit(MockGlobalEventHandlerCubit());
    expect(signInCubit.state, equals(const SignInBaseState.state(...)));
  });
  ```
- `blocTest` is used for behavior after construction, following a
  `setUp` (stub dependencies) → `build` (construct the cubit) → `act` (call cubit
  methods) → `expect` (list of emitted states) → `verify` (mock interaction
  assertions) structure. `setUp` and `verify` are optional per test. Example:
  ```dart
  blocTest(
    'SignInCubit signIn method should call signInUser in repository',
    setUp: () {
      when(() => sessionRepository.signInUser(
        email: 'hi@xmartlabs.com',
        password: 'xmartlabs',
      )).thenAnswer((_) async {});
    },
    build: () => signInCubit = SignInCubit(MockGlobalEventHandlerCubit()),
    act: (bloc) => bloc.signIn(),
    verify: (_) => verify(() => sessionRepository.signInUser(
      email: 'hi@xmartlabs.com',
      password: 'xmartlabs',
    )).called(1),
  );
  ```
- Multi-emission cases stub a repository stream with multiple values (or a
  `Stream.fromIterable([...])`) and assert the full ordered list of expected states in
  `expect`. No `seed:` usage was observed in the current suite — cubits are always
  exercised from their real construction-time initial state, not from a seeded one.
- Related tests are grouped with `group(...)` when they share a stubbed dependency
  context (e.g. `group('Welcome cubit with loaded projects tests', ...)`).

## Repository testing convention

- Repository tests mock the local and remote data sources the repository depends on
  (constructed directly, no DI) and verify the repository:
  1. calls through to the expected source methods,
  2. calls them the right number of times (`verify(...).called(1)`),
  3. returns/propagates the right data or persists incoming remote data back to the
     local source (e.g. verifying `projectLocalSource.replaceProjects(any())` is called
     after fetching from remote).
- Local source tests that talk to Hive use real Hive with a temp directory
  (`initHive()`/`closeHive()` from `common/general_helpers.dart`) rather than mocking
  Hive itself — so these exercise real persistence logic.
- Local source tests backed by a key-value storage abstraction (e.g.
  `LocalSharedPreferencesStorageMock`) mock that storage and assert the source
  reads/writes the expected keys (e.g. `'AuthLocalSource.token'`, `'AuthLocalSource.user'`).
- Remote source tests mock `HttpService` and assert the source builds the right request
  (path, query parameters, body) and correctly parses the response or propagates
  exceptions (`when(...).thenThrow(...)`, `expect(() => call(), throwsA(isA<...>()))`).

## Integration tests

- Located in `integration_test/test/<name>_test.dart` (e.g. `signin_test.dart`), driven
  by `flutter_test`'s `testWidgets` plus `IntegrationTestWidgetsFlutterBinding
  .ensureInitialized()` at the top of `main()`.
- `integration_test/common/` holds shared integration-test helpers:
  - `repository_mocks.dart` — mocktail `Mock` classes for remote sources
    (`MockAuthRemoteSource`, `MockProjectRemoteSource`).
  - `general_helpers.dart` — `commonSetup(...)` boots the real app (`app.initSdks()`),
    then unregisters and re-registers the remote sources in `DiProvider.instance` with
    mocks, so the rest of the app (repositories, cubits, screens) runs for real against
    mocked network boundaries; also defines a `WidgetTesterExtension.contextOfType<T>()`
    helper to grab a `BuildContext` for a given screen widget type.
- Tests drive full user flows through the real widget tree (entering text, tapping
  buttons via `find.widgetWithText`, `pumpAndSettle`) and assert on resulting screens
  or dialogs (e.g. expecting a `WelcomeScreen` after a successful sign-in, or an
  `AlertDialog` after an unauthorized error).
- `tearDown` calls `DiProvider.instance.reset()` to isolate tests from each other.
- Run via `test_driver/integration_test.dart` (a driver that just calls
  `integrationDriver()` from `package:integration_test/integration_test_driver.dart`)
  and the helper script `scripts/integration_test.sh`:
  ```sh
  flutter drive --driver=test_driver/integration_test.dart \
    --target=integration_test/test/signin_test.dart --flavor dev
  ```

## Dependencies

- `flutter_test` (SDK) and `integration_test` (SDK) for widget/integration tests.
- `bloc_test: 9.1.5` for `blocTest`/`MockCubit`.
- `mocktail: 1.0.3` for `Mock`/`Fake`/`when`/`verify`/`any`.

## Lint notes

- `analysis_options.yaml` excludes `test/**` from `dart_code_linter`'s
  `metrics-exclude`, so size/complexity metrics (cyclomatic-complexity,
  long-method, source-lines-of-code, etc.) are not enforced on test files.
  Standard `flutter_lints`/custom lint rules still apply to test code.
