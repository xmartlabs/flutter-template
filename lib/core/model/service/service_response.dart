import 'package:dio/dio.dart';
import 'package:flutter_template/core/common/network_exceptions.dart';

class ServiceResponse<T> {
  final int code;

  final String message;
  final T? data;

  ServiceResponse({required this.code, required this.message, this.data});

  factory ServiceResponse.fromResponse(
    Response response,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    final json = response.data;
    final dataMap = json['data'] as Map<String, dynamic>?;
    final data = (dataMap == null) ? null : fromJsonT(dataMap);
    return ServiceResponse<T>(
      code: json['code'] ?? response.statusCode,
      message: json['message'] ?? response.statusMessage,
      data: data,
    );
  }

  T getDataOrThrow() {
    if (data == null) {
      throw NetworkExceptions.defaultError(code, message);
    }
    return data!;
  }
}
