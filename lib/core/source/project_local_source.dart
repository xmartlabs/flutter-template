import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_template/core/source/common/app_database.dart';

part 'project_local_source.g.dart';

@DriftAccessor(tables: [ProjectTable])
class ProjectLocalSource extends DatabaseAccessor<AppDatabase>
    with _$ProjectLocalSourceMixin {
  ProjectLocalSource(super.attachedDatabase);

  Stream<List<Project>> getProjects() => select(projectTable).watch();

  Future<void> insertProjects(List<Project> projects) =>
      projectTable.insertAll(projects);

  Future<void> deleteAllProjects() => projectTable.deleteAll();

  Future<void> replaceProjects(List<Project>? projects) async =>
      transaction(() async {
        await deleteAllProjects();
        if (projects != null) {
          await insertProjects(projects);
        }
      });
}
