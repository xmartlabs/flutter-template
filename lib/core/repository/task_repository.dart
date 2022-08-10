import 'package:flutter_template/core/common/store/store.dart';
import 'package:flutter_template/core/common/store/store_extensions.dart';
import 'package:flutter_template/core/model/serializer/task_serializer.dart';
import 'package:flutter_template/core/model/task.dart';
import 'package:flutter_template/core/source/task_local_source.dart';
import 'package:flutter_template/core/source/task_remote_source.dart';

class TaskRepository {
  final TaskLocalSource _taskLocalSource;
  final TaskRemoteSource _taskRemoteSource;

  final Store<List<Task>> _store;

  TaskRepository(this._taskLocalSource, this._taskRemoteSource)
      : _store = Store(
            fetcher: FutureFetcher(_taskRemoteSource.getTasks),
            sourceOfTruth: SourceOfTruth(
              reader: _taskLocalSource.getTasks,
              writer: _taskLocalSource.replaceTasks,
            ).mapTo(TaskListSerializer()));

  Stream<List<Task>?> getTasks() => _store.stream();
}
