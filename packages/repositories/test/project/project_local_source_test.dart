import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repositories/src/db/app_database.dart';
import 'package:repositories/src/db/repository_db_entity.dart';
import 'package:repositories/src/project/project_local_source.dart';

void main() {
  late AppDatabase database;
  late ProjectLocalSource projectDao;

  setUp(() async {
    database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
    projectDao = database.projectLocalSource;
  });

  tearDown(() async {
    await database.close();
  });

  group('Test projects db', () {
    test('Get  projects from empty db', () async {
      final projects = await projectDao.getProjects().first;
      expect(projects, []);
    });
    test('Insert one project to db', () async {
      final project = ProjectDbEntity(
        id: 1,
        name: 'Test projects',
        description: 'Test project description',
        url: 'test.com',
        imageUrl: '',
        language: 'ES',
      );
      await projectDao.insertProjects([project]);
      final projects = await projectDao.getProjects().first;
      expect(projects.length, 1);
    });
    test('get all projects', () async {
      final projects = Iterable.generate(
        10,
        (index) => ProjectDbEntity(
          id: index,
          name: 'Test $index project',
          description: 'Test $index project description',
          url: 'test$index.com',
          imageUrl: '',
          language: 'ES',
        ),
      ).toList();
      await projectDao.insertProjects(projects);
      expect((await projectDao.getProjects().first).length, projects.length);
    });
    test('Delete all projects from db', () async {
      final projects = Iterable.generate(
        10,
        (index) => ProjectDbEntity(
          id: index,
          name: 'Test $index project',
          description: 'Test $index project description',
          url: 'test$index.com',
          imageUrl: '',
          language: 'ES',
        ),
      ).toList();
      await projectDao.insertProjects(projects);
      await projectDao.deleteAllProjects();
      expect(await projectDao.getProjects().first, []);
    });
    test('Replace projects from db', () async {
      final projects = Iterable.generate(
        2,
        (index) => ProjectDbEntity(
          id: index,
          name: 'Test $index project',
          description: 'Test $index project description',
          url: 'test$index.com',
          imageUrl: '',
          language: 'ES',
        ),
      ).toList();
      await projectDao.insertProjects(projects);
      final replacement = projects
          .map(
            (e) => ProjectDbEntity(
              id: Random().nextInt(100),
              name: 'Test replace project',
              description: 'Test  project description',
              url: 'tes.com',
              imageUrl: '',
              language: 'ES',
            ),
          )
          .toList();
      await projectDao.replaceProjects(
        replacement,
      );
      final list = await projectDao.getProjects().first;
      bool result = true;
      for (final element in list) {
        if (replacement.firstWhereOrNull((e) => e.id == element.id) == null) {
          result = false;
          break;
        }
      }
      expect(result, true);
    });
  });
}
