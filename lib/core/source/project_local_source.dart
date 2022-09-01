import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_template/core/model/db/repository_db_entity.dart';

@dao
abstract class ProjectLocalSource {
  // It's set in the DAO creation
  late final StreamController<String> changeListener;

  @Query('SELECT * FROM projects')
  Stream<List<ProjectDbEntity>> getProjects();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProjects(List<ProjectDbEntity> projects);

  @Query('DELETE FROM projects')
  Future<void> deleteAllProjects();

  @transaction
  Future<void> replaceProjects(List<ProjectDbEntity>? projects) async {
    await deleteAllProjects();
    if (projects != null) {
      await insertProjects(projects);
    }
    // Floor notifier does not work very well
    // https://github.com/pinchbv/floor/issues/360
    // https://github.com/pinchbv/floor/issues/603
    if (projects == null || projects.isEmpty) {
      changeListener.add('projects');
    }
  }
}
