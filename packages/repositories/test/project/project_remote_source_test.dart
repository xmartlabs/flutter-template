import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:repositories/src/project/project_remote_source.dart';
import 'package:services/networking.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late HttpServiceDio httpService;
  late Dio dio;
  late ProjectRemoteSource projectRemoteSource;
  setUp(() {
    dio = DioMock();
    when(() => dio.interceptors).thenReturn(Interceptors());
    httpService = HttpServiceDio(dio);
    projectRemoteSource = ProjectRemoteSource(httpService);
  });
  test('Get all projects from API', () async {
    const urlGetProjects = 'rest/v1/projects?select=*';
    final requestOptions = RequestOptions(path: urlGetProjects);

    when(() => dio.get(urlGetProjects)).thenAnswer(
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
}
