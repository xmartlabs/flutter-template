import 'package:dio/dio.dart';
import 'package:services/networking.dart';

extension HttpServiceCommon on HttpService {
  Future<ServiceResponse<T>> getAndProcessResponse<T>(
    String uri, {
    required T Function(dynamic json) serializer,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
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
    required T Function(dynamic json) serializer,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
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
    required T Function(dynamic json) serializer,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
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
    required T Function(dynamic json) serializer,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
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
    R Function(dynamic json) serializer,
  ) {
    if (isSuccess) {
      return ServiceResponse<R>.data(serializer(data));
    }
    return ServiceResponse<R>.error(
      NetworkException.handleResponse(statusCode, data),
    );
  }
}
