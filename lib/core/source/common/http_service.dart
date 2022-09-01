import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter_template/core/common/config.dart';
import 'package:flutter_template/core/common/network_exceptions.dart';
import 'package:flutter_template/core/model/service/service_response.dart';

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
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}

class HttpServiceDio implements HttpService {
  late Dio _dio;

  HttpServiceDio(List<Interceptor> interceptors) {
    final options = BaseOptions(
      baseUrl: Config.apiBaseUrl,
      // TODO: Remove api key. It's only needed for Supabase
      headers: {'apikey': Config.supabaseApiKey},
    );
    _dio = Dio(options);
    _dio.interceptors.addAll(interceptors);
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
  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async =>
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
      await call().catchError((e) => throw NetworkException.getDioException(e));
}

extension HttpServiceCommon on HttpService {
  Future<ServiceResponse<T>> getAndProcessResponse<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    required T Function(dynamic json) serializer,
  }) async {
    final response = await get(
      uri,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response.processServiceResponse(serializer);
  }

  Future<ServiceResponse<T>> postAndProcessResponse<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T Function(dynamic json) serializer,
  }) async {
    final response = await post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response.processServiceResponse(serializer);
  }

  Future<ServiceResponse<T>> putAndProcessResponse<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T Function(dynamic json) serializer,
  }) async {
    final response = await put(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response.processServiceResponse(serializer);
  }

  Future<ServiceResponse<T>> deleteAndProcessResponse<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T Function(dynamic json) serializer,
  }) async {
    final response = await delete(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response.processServiceResponse(serializer);
  }
}

extension ResponseExtensions<T> on Response<T> {
  bool get isSuccess => statusCode == 200;

  ServiceResponse<R> processServiceResponse<R>(
      R Function(dynamic json) serializer) {
    if (isSuccess) {
      return ServiceResponse<R>.data(serializer(data));
    }
    return ServiceResponse<R>.error(
      NetworkException.handleResponse(statusCode, data),
    );
  }
}
