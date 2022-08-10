import 'package:floor/floor.dart';
import 'package:flutter_template/core/model/db/task_db_entity.dart';

@dao
abstract class TaskLocalSource {
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
  }
}
