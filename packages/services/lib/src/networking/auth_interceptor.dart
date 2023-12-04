import 'dart:io';

import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Future<String?> Function() _isAuthorized;
  final Future<void> Function() _unauthorize;

  AuthInterceptor(this._isAuthorized, this._unauthorize);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _isAuthorized.call();
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
      await _unauthorize.call();
    }
    handler.next(err);
  }
}
