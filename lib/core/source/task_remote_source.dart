import 'package:flutter_template/core/model/service/list_response.dart';
import 'package:flutter_template/core/model/service/service_response.dart';
import 'package:flutter_template/core/model/task.dart';
import 'package:flutter_template/core/source/common/http_service.dart';

class TaskRemoteSource {
  static const _urlGetTasks = 'task';

  final HttpServiceDio _httpService;

  TaskRemoteSource(this._httpService);

  Future<List<Task>> getTasks() async => _httpService
      .getAndProcessResponse(_urlGetTasks,
          serializer: (listResponse) =>
              ListResponse.fromJson(listResponse, Task.fromJson))
      .then((value) => value.getDataOrThrow().data);
}
