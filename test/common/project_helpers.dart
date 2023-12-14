import 'package:flutter_template/core/model/db/repository_db_entity.dart';
import 'package:flutter_template/core/model/project.dart';

List<ProjectDbEntity> generateProjectDbEntities(int count) => Iterable.generate(
      count,
      (index) => ProjectDbEntity(
        id: index,
        name: 'Test $index project',
        description: 'Test $index project description',
        url: 'test$index.com',
        imageUrl: '',
        language: 'ES',
      ),
    ).toList();

List<Project> generateProjects(int count) => Iterable.generate(
      count,
      (index) => Project(
        id: index,
        name: 'Test $index project',
        description: 'Test $index project description',
        url: 'test$index.com',
        imageUrl: '',
        language: 'ES',
      ),
    ).toList();
