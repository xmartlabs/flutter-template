import 'package:flutter_template/core/common/network_exceptions.dart';

class ServiceResponse<T> {
  final int code;

  final String message;
  final T? data;

  ServiceResponse(this.code, this.message, this.data);

  factory ServiceResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    final dataMap = json['data'] as Map<String, dynamic>?;
    final data = (dataMap == null) ? null : fromJsonT(dataMap);
    return ServiceResponse<T>(
        json['code'] as int, json['message'] as String, data);
  }

  T getDataOrThrow() {
    if (data == null) {
      throw NetworkExceptions.defaultError(code, message);
    }
    return data!;
  }
}
