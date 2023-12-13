import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/project.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/db/repository_db_entity.dart';
import 'package:repositories/src/project/project_local_source.dart';
import 'package:repositories/src/project/project_remote_source.dart';

class ProjectLocalSourceMock extends Mock implements ProjectLocalSource {}

class ProjectRemoteSourceMock extends Mock implements ProjectRemoteSource {}

void main() {
  late ProjectLocalSource projectLocalSource;
  late ProjectRemoteSource projectRemoteSource;
  late ProjectRepository projectRepository;

  setUp(() async {
    projectRepository = ProjectRepository(
      projectLocalSource = ProjectLocalSourceMock(),
      projectRemoteSource = ProjectRemoteSourceMock(),
    );
  });

  test('get projects from empty state', () async {
    when(() => projectLocalSource.getProjects()).thenAnswer(
      (_) => Stream.value([]),
    );
    when(() => projectRemoteSource.getProjects()).thenAnswer(
      (_) async => [],
    );
    //Default case for creating the repository
    when(() => projectLocalSource.replaceProjects(any()))
        .thenAnswer((_) async {});

    final projects = await projectRepository.getProjects().first;

    verify(() => projectLocalSource.getProjects()).called(1);
    verify(() => projectRemoteSource.getProjects()).called(1);
    verify(() => projectLocalSource.replaceProjects(any())).called(1);

    expect(projects, []);
  });

  test(
    'get projects stream from a loaded state, should return a stream that gives 2 values',
    () async {
      when(() => projectLocalSource.getProjects()).thenAnswer(
        (_) => Stream.value(
          [
            ProjectDbEntity(
              id: 1,
              name: 'Test projects',
              description: 'Test project description',
              url: 'test.com',
              imageUrl: '',
              language: 'ES',
            ),
            ProjectDbEntity(
              id: 2,
              name: 'Test projects',
              description: 'Test project description',
              url: 'test.com',
              imageUrl: '',
              language: 'ES',
            ),
          ],
        ),
      );
      when(() => projectLocalSource.replaceProjects(any()))
          .thenAnswer((_) async {});
      when(() => projectRemoteSource.getProjects()).thenAnswer(
        (_) async => [
          Project(
            id: 1,
            name: 'Test projects',
            description: 'Test project description',
            url: 'test.com',
            imageUrl: '',
            language: 'ES',
          ),
          Project(
            id: 2,
            name: 'Test projects',
            description: 'Test project description',
            url: 'test.com',
            imageUrl: '',
            language: 'ES',
          ),
        ],
      );

      final list = await projectRepository.getProjects().first;
      verify(() => projectLocalSource.getProjects()).called(1);
      verify(() => projectRemoteSource.getProjects()).called(1);
      verify(() => projectLocalSource.replaceProjects(any())).called(1);
      expect(list?.length, 2);
    },
  );
}
