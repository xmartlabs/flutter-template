import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/repository/project_repository.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/welcome/welcome_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../common/cubit_mocks.dart';
import '../common/data_mocks.dart';
import '../common/project_helpers.dart';

void main() {
  late GetIt getIt;
  late SessionRepository sessionRepository;
  late ProjectRepository projectRepository;
  late WelcomeCubit welcomeCubit;

  setUp(() {
    getIt = DiProvider.instance
      ..registerSingleton<SessionRepository>(
        sessionRepository = MockSessionRepository(),
      )
      ..registerSingleton<ProjectRepository>(
        projectRepository = MockProjectRepository(),
      );
  });

  tearDown(() => getIt.reset());
  test(
    'Create Welcome cubit, should return a WelcomeCubit with base state',
    () {
      when(() => projectRepository.getProjects()).thenAnswer(
        (_) => Stream.value([]),
      );
      welcomeCubit = WelcomeCubit(MockGlobalEventHandlerCubit());

      expect(welcomeCubit.state, equals(const WelcomeBaseState.state()));
    },
  );

  group('Welcome cubit with loaded projects tests', () {
    blocTest(
      'Welcome cubit is created when project repository has data, should have'
      ' projects in state',
      setUp: () {
        when(() => projectRepository.getProjects()).thenAnswer(
          (_) => Stream.value(generateProjects(1)),
        );
      },
      build: () => welcomeCubit = WelcomeCubit(MockGlobalEventHandlerCubit()),
      expect: () => [
        WelcomeBaseState.state(
          projects: generateProjects(1),
        ),
      ],
    );

    blocTest(
      'Welcome cubit is created when project repository is empty, project '
      'repository stream emits new values then WelcomeCubit should emit a new '
      'state with projects',
      setUp: () {
        when(() => projectRepository.getProjects()).thenAnswer(
          (_) => Stream.fromIterable([
            generateProjects(1),
            generateProjects(2),
          ]),
        );
      },
      build: () => welcomeCubit = WelcomeCubit(MockGlobalEventHandlerCubit()),
      expect: () => [
        WelcomeBaseState.state(
          projects: generateProjects(1),
        ),
        WelcomeBaseState.state(
          projects: generateProjects(2),
        ),
      ],
    );

    blocTest(
      // ignore: lines_longer_than_80_chars
      'Welcome cubit calls logOut from sessionRepository when the screen calls logOut method from cubit',
      build: () => welcomeCubit = WelcomeCubit(MockGlobalEventHandlerCubit()),
      setUp: () {
        when(() => sessionRepository.logOut()).thenAnswer(
          (_) async {},
        );
        when(() => projectRepository.getProjects()).thenAnswer(
          (_) => Stream.value([]),
        );
      },
      act: (cubit) => cubit.logOut(),
      verify: (_) => verify(() => sessionRepository.logOut()).called(1),
    );
  });
}
