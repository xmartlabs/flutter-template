import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/core/model/service/auth_models.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:flutter_template/core/source/common/http_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/data_mocks.dart';

void main() {
  late HttpService httpService;
  late AuthRemoteSource authRemoteSource;

  setUp(() {
    httpService = HttpServiceMock();
    authRemoteSource = AuthRemoteSource(httpService);
  });

  test('signIn call to API with valid values should return a token', () async {
    const uri = 'auth/v1/token';
    final requestOptions = RequestOptions(path: uri);

    when(
      () => httpService.post(
        uri,
        queryParameters: {'grant_type': 'password'},
        data: SignInRequest(email: 'test@email.com', password: '1234').toJson(),
      ),
    ).thenAnswer(
      (_) async => Response(
        data: SignInResponse(
          accessToken: 'abc123',
          user: User(email: 'test@email.com', name: 'test'),
        ).toJson(),
        statusCode: 200,
        requestOptions: requestOptions,
      ),
    );

    final result = await authRemoteSource.signIn('test@email.com', '1234');
    expect(result.accessToken, 'abc123');
  });

  test('signIn call to API with invalid values should return a exception',
      () async {
    const uri = 'auth/v1/token';

    when(
      () => httpService.post(
        uri,
        queryParameters: {'grant_type': 'password'},
        data: any(named: 'data'),
      ),
    ).thenThrow(
      const HttpException(''),
    );

    expect(
      () => authRemoteSource.signIn('test@email.com', '1224'),
      throwsA(isA<HttpException>()),
    );
  });
}
