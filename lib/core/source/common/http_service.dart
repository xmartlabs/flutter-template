import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter_template/core/common/network_exceptions.dart';

abstract class HttpService {
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}

// Sample api https://www.appsloveworld.com/sample-rest-api-url-for-testing-with-authentication
class HttpServiceDio implements HttpService {
  late Dio _dio;

  HttpServiceDio() {
    final options =
        BaseOptions(baseUrl: 'http://restapi.adequateshop.com/api/');
    _dio = Dio(options);
    // dio.interceptors.add(DioCacheManager(
    //   CacheConfig(
    //     baseUrl: baseUrl,
    //   ),
    // ).interceptor);
    // dio.interceptors.add(AuthInterceptor());
  }

  @override
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async =>
      _processNetworkCall(() => _dio.get(
            uri,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          ));

  @override
  Future<Response> delete(String uri,
          {data,
          Map<String, dynamic>? queryParameters,
          Options? options,
          CancelToken? cancelToken,
          ProgressCallback? onSendProgress,
          ProgressCallback? onReceiveProgress}) async =>
      _processNetworkCall(() => _dio.delete(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          ));

  @override
  Future<Response> post(String uri,
          {data,
          Map<String, dynamic>? queryParameters,
          Options? options,
          CancelToken? cancelToken,
          ProgressCallback? onSendProgress,
          ProgressCallback? onReceiveProgress}) async =>
      _processNetworkCall(() => _dio.post(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          ));

  @override
  Future<Response> put(String uri,
          {data,
          Map<String, dynamic>? queryParameters,
          Options? options,
          CancelToken? cancelToken,
          ProgressCallback? onSendProgress,
          ProgressCallback? onReceiveProgress}) =>
      _processNetworkCall(() => _dio.put(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          ));

  Future<Response> _processNetworkCall(
          Future<Response> Function() call) async =>
      await call()
          .catchError((e) => throw NetworkExceptions.getDioException(e));
}
