import 'package:dio/dio.dart';
import 'package:flutter_template/core/source/common/http_service.dart';
import 'package:flutter_template/core/source/project_remote_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/data_mocks.dart';
import '../../common/general_helpers.dart';
import '../../common/project_helpers.dart';

void main() {
  late HttpService httpService;
  late ProjectRemoteSource projectRemoteSource;

  setUp(() {
    httpService = HttpServiceMock();
    projectRemoteSource = ProjectRemoteSource(httpService);
  });

  test('Get projects from API should return one project', () async {
    const urlGetProjects = 'rest/v1/projects?select=*';
    final requestOptions = RequestOptions(path: urlGetProjects);
    final projects = generateProjects(1);
    when(() => httpService.get(urlGetProjects)).thenAnswer(
      (_) async => successResponse(projects, requestOptions),
    );

    final result = await projectRemoteSource.getProjects();
    expect(result, projects);
  });
  test('Get projects from empty API should return empty', () async {
    const urlGetProjects = 'rest/v1/projects?select=*';
    final requestOptions = RequestOptions(path: urlGetProjects);

    when(() => httpService.get(urlGetProjects)).thenAnswer(
      (_) async => successResponse([], requestOptions),
    );

    final result = await projectRemoteSource.getProjects();
    expect(result.isEmpty, true);
  });
}
