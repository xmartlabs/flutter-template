import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_template/core/model/db/task_db_entity.dart';

@dao
abstract class TaskLocalSource {
  // It's set in the DAO creation
  late final StreamController<String> changeListener;

  @Query('SELECT * FROM tasks')
  Stream<List<TaskDbEntity>> getTasks();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTasks(List<TaskDbEntity> tasks);

  @Query('DELETE FROM tasks')
  Future<void> deleteAllTasks();

  @transaction
  Future<void> replaceTasks(List<TaskDbEntity>? tasks) async {
    await deleteAllTasks();
    if (tasks != null) {
      await insertTasks(tasks);
    }
    // Floor notifier does not work very well
    // https://github.com/pinchbv/floor/issues/360
    // https://github.com/pinchbv/floor/issues/603
    if (tasks == null || tasks.isEmpty) {
      changeListener.add('tasks');
    }
  }
}
