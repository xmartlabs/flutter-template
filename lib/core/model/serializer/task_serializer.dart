import 'package:flutter_template/core/model/db/task_db_entity.dart';
import 'package:flutter_template/core/model/serializer/entity_serializer.dart';
import 'package:flutter_template/core/model/task.dart';

class TaskSerializer extends SimpleEntitySerializer<Task, TaskDbEntity> {
  @override
  TaskDbEntity commonToDatabaseModel(Task commonModel) => TaskDbEntity(
        id: commonModel.id,
        description: commonModel.description,
        isCompleted: commonModel.isCompleted,
      );

  @override
  Task databaseToCommonModel(TaskDbEntity serviceModel) => Task(
        id: serviceModel.id,
        description: serviceModel.description,
        isCompleted: serviceModel.isCompleted,
      );
}

class TaskListSerializer
    extends SimpleEntitySerializer<List<Task>, List<TaskDbEntity>> {
  final _taskSerializer = TaskSerializer();

  @override
  List<TaskDbEntity> commonToDatabaseModel(List<Task> commonModel) =>
      commonModel.map(_taskSerializer.commonToDatabaseModel).toList();

  @override
  List<Task> databaseToCommonModel(List<TaskDbEntity> databaseModel) =>
      databaseModel.map(_taskSerializer.databaseToCommonModel).toList();
}
