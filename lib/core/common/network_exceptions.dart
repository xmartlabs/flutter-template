import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkException with _$NetworkException implements Exception {
  const factory NetworkException.unauthorizedRequest(body) =
      UnauthorizedRequest;

  const factory NetworkException.badRequest() = BadRequest;

  const factory NetworkException.notFound(String reason) = NotFound;

  const factory NetworkException.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkException.notAcceptable() = NotAcceptable;

  const factory NetworkException.conflict() = Conflict;

  const factory NetworkException.internalServerError() = InternalServerError;

  const factory NetworkException.notImplemented() = NotImplemented;

  const factory NetworkException.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkException.noInternetConnection() = NoInternetConnection;

  const factory NetworkException.formatException() = FormatException;

  const factory NetworkException.unableToProcess() = UnableToProcess;

  const factory NetworkException.defaultError(int? code, String? error) =
      DefaultError;

  const factory NetworkException.unexpectedError() = UnexpectedError;

  static NetworkException handleResponse(int? statusCode, dynamic body) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return NetworkException.unauthorizedRequest(body);
      case 404:
        return const NetworkException.notFound('Not found');
      case 409:
        return const NetworkException.conflict();
      case 408:
        return const NetworkException.noInternetConnection();
      case 500:
        return const NetworkException.internalServerError();
      case 503:
        return const NetworkException.serviceUnavailable();
      default:
        return NetworkException.defaultError(
          statusCode,
          'Received invalid status code. body: $body',
        );
    }
  }

  static NetworkException getDioException(error) {
    if (error is Exception) {
      try {
        NetworkException networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
            case DioErrorType.connectTimeout:
            case DioErrorType.other:
            case DioErrorType.receiveTimeout:
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkException.noInternetConnection();
              break;
            case DioErrorType.response:
              networkExceptions = NetworkException.handleResponse(
                error.response?.statusCode,
                error.response?.data,
              );
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkException.noInternetConnection();
        } else {
          networkExceptions = const NetworkException.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkException.formatException();
      } catch (_) {
        return const NetworkException.unexpectedError();
      }
    } else {
      return error.toString().contains('is not a subtype of')
          ? const NetworkException.unableToProcess()
          : const NetworkException.unexpectedError();
    }
  }

  static String getErrorMessage(NetworkException networkExceptions) {
    var errorMessage = '';
    networkExceptions.when(
      notImplemented: () {
        errorMessage = 'Not Implemented';
      },
      internalServerError: () {
        errorMessage = 'Internal Server Error';
      },
      notFound: (String reason) {
        errorMessage = reason;
      },
      serviceUnavailable: () {
        errorMessage = 'Service unavailable';
      },
      methodNotAllowed: () {
        errorMessage = 'Method Allowed';
      },
      badRequest: () {
        errorMessage = 'Bad request';
      },
      unauthorizedRequest: (body) {
        errorMessage = 'Unauthorized request - $body';
      },
      unexpectedError: () {
        errorMessage = 'Unexpected error occurred';
      },
      noInternetConnection: () {
        errorMessage = 'No internet connection';
      },
      conflict: () {
        errorMessage = 'Error due to a conflict';
      },
      unableToProcess: () {
        errorMessage = 'Unable to process the data';
      },
      defaultError: (int? code, String? error) {
        errorMessage = error ?? 'Unexpected error occurred';
      },
      formatException: () {
        errorMessage = 'Unexpected error occurred';
      },
      notAcceptable: () {
        errorMessage = 'Not acceptable';
      },
    );

    return errorMessage;
  }
}
