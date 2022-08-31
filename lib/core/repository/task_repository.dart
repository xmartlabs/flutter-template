import 'package:flutter_template/core/model/db/task_db_entity.dart';
import 'package:flutter_template/core/model/serializer/task_serializer.dart';
import 'package:flutter_template/core/model/task.dart';
import 'package:flutter_template/core/source/task_local_source.dart';
import 'package:flutter_template/core/source/task_remote_source.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stock/stock.dart';

class TaskRepository {
  // ignore: unused_field
  final TaskLocalSource _taskLocalSource;

  // ignore: unused_field
  final TaskRemoteSource _taskRemoteSource;

  final Stock<dynamic, List<Task>> _store;

  TaskRepository(this._taskLocalSource, this._taskRemoteSource)
      : _store = Stock(
            fetcher: Fetcher.ofFuture((_) => _taskRemoteSource.getTasks()),
            sourceOfTruth: SourceOfTruth<dynamic, List<TaskDbEntity>>(
              reader: (_) => _taskLocalSource.getTasks(),
              writer: (_, value) async {
                await _taskLocalSource.replaceTasks(value);
              },
            ).mapToUsingMapper(TaskListStockTypeMapper()));

  Stream<List<Task>?> getTasks() => _store
      .stream(null)
      .doOnData((data) {
        print('data');
        print(data);
      })
      .where((event) => event.isData)
      .map((event) => event.requireData());
}
