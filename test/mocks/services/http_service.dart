import 'package:dio/dio.dart';
import 'package:flutter_template/core/source/common/http_service.dart';
import 'package:mocktail/mocktail.dart';

class FakeHttpService extends Mock implements HttpServiceDio {}

typedef ResponseData = Map<String, dynamic>;
typedef ApiOverrideKey = ({String path, ApiMethod method});

enum ApiMethod { apiPost, apiGet, apiDelete, apiPut }

extension MockApiServiceExtension on FakeHttpService {
  void mockApi(Map<ApiOverrideKey, ResponseData> apiOverrides) {
    for (final element in apiOverrides.entries) {
      switch (element.key.method) {
        case ApiMethod.apiPost:
          _mockPost(element.key.path, element.value);
        case ApiMethod.apiGet:
          _mockGet(element.key.path, element.value);
        case ApiMethod.apiDelete:
          _mockDelete(element.key.path, element.value);
        case ApiMethod.apiPut:
          _mockPut(element.key.path, element.value);
      }
    }
  }

  void _mockPost(
    String path,
    Map<String, dynamic> response, {
    Map<String, dynamic>? parameters,
  }) =>
      when(() => post(path, queryParameters: parameters)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: path),
          data: response,
        ),
      );
  void _mockGet(
    String path,
    Map<String, dynamic> response, {
    Map<String, dynamic>? parameters,
  }) =>
      when(() => get(path, queryParameters: parameters)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: path),
          data: response,
        ),
      );
  void _mockDelete(
    String path,
    Map<String, dynamic> response, {
    Map<String, dynamic>? parameters,
  }) =>
      when(() => delete(path, queryParameters: parameters)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: path),
          data: response,
        ),
      );
  void _mockPut(
    String path,
    Map<String, dynamic> response, {
    Map<String, dynamic>? parameters,
  }) =>
      when(() => put(path, queryParameters: parameters)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: path),
          data: response,
        ),
      );
}
