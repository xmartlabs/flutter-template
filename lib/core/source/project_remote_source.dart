import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/core/model/service/service_response.dart';
import 'package:flutter_template/core/source/common/http_service.dart';

class ProjectRemoteSource {
  static const _urlGetProjects = 'rest/v1/projects?select=*';

  final HttpService _httpService;

  ProjectRemoteSource(this._httpService);

  Future<List<Project>> getProjects() => _httpService
      .getAndProcessResponse(
        _urlGetProjects,
        serializer: (listResponse) => (listResponse as List)
            .map((project) => Project.fromJson(project))
            .toList(),
      )
      .then((value) => value.getDataOrThrow());
}
