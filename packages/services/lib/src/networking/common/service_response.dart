import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:services/src/networking/common/network_exceptions.dart';

part 'service_response.freezed.dart';

@freezed
sealed class ServiceResponse<T> with _$ServiceResponse {
  const factory ServiceResponse.data(T data) = ServiceResponseData<T>;

  const factory ServiceResponse.error(NetworkException error) =
      ServiceResponseError;
}

extension ServiceResponseExtensions<T> on ServiceResponse<T> {
  T getDataOrThrow() {
    if (this is ServiceResponseData<T>) {
      return (this as ServiceResponseData<T>).data;
    } else {
      throw (this as ServiceResponseError).error;
    }
  }
}
