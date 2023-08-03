import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/core/repository/project_repository.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/welcome/welcome_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'welcome_cubit_test.mocks.dart';

@GenerateMocks([ProjectRepository, SessionRepository])
void main() {
  final ProjectRepository projectRepository = MockProjectRepository();
  final SessionRepository sessionRepository = MockSessionRepository();
  DiProvider.instance
    ..registerSingleton<ProjectRepository>(projectRepository)
    ..registerSingleton<SessionRepository>(sessionRepository);

  group('Welcome cubit tests', () {
    blocTest<WelcomeCubit, WelcomeBaseState>(
      'emits empty state when cubit is created.',
      build: () {
        when(projectRepository.getProjects()).thenAnswer(
          (_) => const Stream.empty(),
        );
        return WelcomeCubit(null);
      },
      // act: (cubit) => cubit,
      expect: () => <WelcomeBaseState>[],
    );

    blocTest<WelcomeCubit, WelcomeBaseState>(
      'emits loaded state.',
      build: () {
        when(projectRepository.getProjects()).thenAnswer(
          (_) => _mockProjectsStream(),
        );
        return WelcomeCubit(null);
      },
      // act: (cubit) => cubit,
      expect: () => <WelcomeBaseState>[
        WelcomeBaseState.state(
          projects: [
            Project(
              id: 1,
              name: 's',
              description: '',
              url: '',
              imageUrl: '',
              language: '',
            ),
          ],
        ),
      ],
    );
  });
}

Stream<List<Project>?> _mockProjectsStream() => Stream.fromIterable([
      [
        Project(
          id: 1,
          name: 's',
          description: '',
          url: '',
          imageUrl: '',
          language: '',
        ),
      ],
    ]);
