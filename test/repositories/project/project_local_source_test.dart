import 'dart:math';

import 'package:flutter_template/core/model/db/repository_db_entity.dart';
import 'package:flutter_template/core/source/common/app_database.dart';
import 'package:flutter_template/core/source/project_local_source.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/general_helpers.dart';
import '../../common/project_helpers.dart';

void main() {
  late AppDatabase database;
  late ProjectLocalSource projectDao;

  setUp(() async {
    database = await setupFloorDatabase();
    projectDao = database.projectLocalSource;
  });

  tearDown(() async {
    await database.close();
  });

  group('Test projects db', () {
    test('Get projects from empty db, should return an empty list', () async {
      final projects = await projectDao.getProjects().first;
      expect(projects, []);
    });
    test('Insert one project to empty db, should return 1 project', () async {
      final projects = generateProjectDbEntities(1);
      await projectDao.insertProjects(projects);
      expect(
        await projectDao.getProjects().first,
        projects,
      );
    });
    test('get all projects from db, should return 10', () async {
      final projects = generateProjectDbEntities(10);
      await projectDao.insertProjects(projects);
      expect(await projectDao.getProjects().first, projects);
    });
    test('Delete all projects from db, should return empty list', () async {
      final projects = generateProjectDbEntities(10);
      await projectDao.insertProjects(projects);
      await projectDao.deleteAllProjects();
      expect(await projectDao.getProjects().first, []);
    });
    test('Replace 2 projects from db, should return two new projects',
        () async {
      final projects = generateProjectDbEntities(2);
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
      expect(list, replacement);
    });
  });
}
