import 'package:flutter_template/core/model/project.dart';

List<Project> generateProjects(int count) => Iterable.generate(
      count,
      (index) => Project(
        id: index,
        name: 'Test $index project',
        description: 'Test $index project description',
        url: 'test$index.com',
        imageUrl: '',
        language: 'Dart',
      ),
    ).toList();
