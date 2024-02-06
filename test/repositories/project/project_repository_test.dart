// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_template/core/repository/project_repository.dart';
import 'package:flutter_template/core/source/project_local_source.dart';
import 'package:flutter_template/core/source/project_remote_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/data_mocks.dart';
import '../../common/project_helpers.dart';

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
      final projects = generateProjects(2);
      when(() => projectLocalSource.getProjects()).thenAnswer(
        (_) => Stream.value(
          generateProjectDbEntities(2),
        ),
      );
      when(() => projectLocalSource.replaceProjects(any()))
          .thenAnswer((_) async {});
      when(() => projectRemoteSource.getProjects()).thenAnswer(
        (_) async => generateProjects(2),
      );

      final list = await projectRepository.getProjects().first;
      verify(() => projectLocalSource.getProjects()).called(1);
      verify(() => projectRemoteSource.getProjects()).called(1);
      verify(() => projectLocalSource.replaceProjects(any())).called(1);
      expect(
        list,
        projects,
      );
    },
  );
}
