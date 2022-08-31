import 'package:flutter_template/core/model/db/task_db_entity.dart';
import 'package:flutter_template/core/model/task.dart';
import 'package:stock/stock.dart';

class TaskStockTypeMapper extends StockTypeMapper<TaskDbEntity, Task> {
  @override
  TaskDbEntity fromOutput(Task commonModel) => TaskDbEntity(
        id: commonModel.id,
        description: commonModel.description,
        isCompleted: commonModel.isCompleted,
      );

  @override
  Task fromInput(TaskDbEntity serviceModel) => Task(
        id: serviceModel.id,
        description: serviceModel.description,
        isCompleted: serviceModel.isCompleted,
      );
}

class TaskListStockTypeMapper
    extends StockTypeMapper<List<TaskDbEntity>, List<Task>> {
  final _taskSerializer = TaskStockTypeMapper();

  @override
  List<Task> fromInput(List<TaskDbEntity> databaseModel) =>
      databaseModel.map(_taskSerializer.fromInput).toList();

  @override
  List<TaskDbEntity> fromOutput(List<Task> commonModel) =>
      commonModel.map(_taskSerializer.fromOutput).toList();
}
