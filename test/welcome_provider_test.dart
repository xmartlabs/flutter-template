import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/core/repository/project_repository.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/welcome/welcome_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'welcome_provider_test.mocks.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks(
  [MockSpec<SessionRepository>(), MockSpec<ProjectRepository>()],
)
void main() {
  late SessionRepository sessionRepository;
  late ProjectRepository projectRepository;
  late WelcomeProvider welcomeProvider;
  final locator = GetIt.instance;

  setUp(() {
    sessionRepository = MockSessionRepository();
    projectRepository = MockProjectRepository();
    locator
      ..registerLazySingleton<SessionRepository>(() => sessionRepository)
      ..registerLazySingleton<ProjectRepository>(() => projectRepository);
  });

  tearDown(() {
    locator.reset();
  });

  test('Create provider with empty data', () {
    welcomeProvider = WelcomeProvider(null);
    expect(welcomeProvider.projects, []);
  });

  test('create provider with data', () async {
    final projects = [
      Project(
        id: 1,
        name: 'Project 1',
        description: 'Description 1',
        url: 'url 1',
        imageUrl: 'imageUrl 1',
        language: 'dart',
      ),
      Project(
        id: 1,
        name: 'Project 1',
        description: 'Description 1',
        url: 'url 1',
        imageUrl: 'imageUrl 1',
        language: 'dart',
      ),
    ];
    when(projectRepository.getProjects()).thenAnswer(
      (_) => Stream.value(projects),
    );
    welcomeProvider = WelcomeProvider(null);
    expect(welcomeProvider.projects, projects);
  });

  test('call log out', () async {
    when(sessionRepository.logOut()).thenAnswer((_) => Future.value());
    welcomeProvider = WelcomeProvider(null);
    await welcomeProvider.logOut();
    verify(sessionRepository.logOut());
  });
}
