import 'package:models/project.dart';
import 'package:services/networking.dart';

class ProjectRemoteSource {
  static const _urlGetProjects = 'rest/v1/projects?select=*';

  final HttpServiceDio _httpService;

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
