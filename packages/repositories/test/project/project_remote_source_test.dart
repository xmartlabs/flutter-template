import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:repositories/src/project/project_remote_source.dart';
import 'package:services/networking.dart';

class HttpServiceMock extends Mock implements HttpService {}

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

    when(() => httpService.get(urlGetProjects)).thenAnswer(
      (_) async => Response(
        data: [
          {
            'id': 1,
            'name': 'Test projects',
            'description': 'Test project description',
            'url': 'test.com',
            'image_url': '',
            'language': 'ES',
          }
        ],
        statusCode: 200,
        requestOptions: requestOptions,
      ),
    );

    final result = await projectRemoteSource.getProjects();
    expect(result.length, 1);
  });
  test('Get projects from empty API should return empty', () async {
    const urlGetProjects = 'rest/v1/projects?select=*';
    final requestOptions = RequestOptions(path: urlGetProjects);

    when(() => httpService.get(urlGetProjects)).thenAnswer(
      (_) async => Response(
        data: [],
        statusCode: 200,
        requestOptions: requestOptions,
      ),
    );

    final result = await projectRemoteSource.getProjects();
    expect(result.isEmpty, true);
  });
}
