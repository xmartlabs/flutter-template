import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalSource _authLocalSource;

  AuthInterceptor(this._authLocalSource);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _authLocalSource.getUserToken().first;
    if (accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      await _authLocalSource.saveUserToken(null);
    }
    handler.next(err);
  }
}
