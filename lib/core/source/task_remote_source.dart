import 'package:flutter_template/core/model/service/list_response.dart';
import 'package:flutter_template/core/model/task.dart';
import 'package:flutter_template/core/source/common/http_service.dart';

class TaskRemoteSource {
  final HttpServiceDio _httpService;

  static const _urlGetTasks = 'user/login';

  TaskRemoteSource(this._httpService);

  Future<List<Task>> getTasks() async => _httpService
      .getAndProcessResponse(
        _urlGetTasks,
        serializer: (listResponse) =>
            ListResponse.fromJson(listResponse, Task.fromJson),
      )
      .then((value) => value.getDataOrThrow())
      .then((value) => value.data);
}
