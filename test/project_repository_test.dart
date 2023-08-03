import 'package:flutter_template/core/model/db/repository_db_entity.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/core/repository/project_repository.dart';
import 'package:flutter_template/core/source/project_local_source.dart';
import 'package:flutter_template/core/source/project_remote_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'project_repository_tests.mocks.dart';

@GenerateMocks([ProjectRemoteSource, ProjectLocalSource])
void main() {
  final remote = MockProjectRemoteSource();
  final local = MockProjectLocalSource();
  when(remote.getProjects()).thenAnswer(
    (inv) => Future.value([
      Project(
        id: 1,
        name: 's',
        description: '',
        url: '',
        imageUrl: '',
        language: '',
      ),
    ]),
  );

  final ProjectRepository repository = ProjectRepository(local, remote);

  test('Fetch projects', () async {
    when(local.getProjects()).thenAnswer(
      (inv) => Stream.value([
        ProjectDbEntity(
          id: 1,
          name: 's',
          description: '',
          url: '',
          imageUrl: '',
          language: '',
        ),
      ]),
    );
    final data = await repository.getProjects().first;
    expect(data, [
      Project(
        id: 1,
        name: 's',
        description: '',
        url: '',
        imageUrl: '',
        language: '',
      ),
    ]);
  });
  test('Fetch empty projects', () async {
    when(local.getProjects()).thenAnswer(
      (inv) => Stream.value([]),
    );
    final data = await repository.getProjects().first;
    expect(data, []);
  });
}
