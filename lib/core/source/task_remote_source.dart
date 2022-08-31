import 'package:flutter_template/core/model/service/service_response.dart';
import 'package:flutter_template/core/model/task.dart';
import 'package:flutter_template/core/source/common/http_service.dart';

class TaskRemoteSource {
  static const _urlGetTasks = 'rest/v1/tasks?select=*';

  final HttpServiceDio _httpService;

  TaskRemoteSource(this._httpService);

  Future<List<Task>> getTasks() async => _httpService
      .getAndProcessResponse(_urlGetTasks,
          serializer: (listResponse) => (listResponse as List)
              .map((task) => Task.fromJson(task))
              .toList())
      .then((value) => value.getDataOrThrow());
}
