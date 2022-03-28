import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions extends Object with _$NetworkExceptions {
  const factory NetworkExceptions.unauthorizedRequest() = UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(int? code, String? error) =
      DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(int? statusCode, dynamic body) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return const NetworkExceptions.unauthorizedRequest();
      case 404:
        return const NetworkExceptions.notFound('Not found');
      case 409:
        return const NetworkExceptions.conflict();
      case 408:
        return const NetworkExceptions.noInternetConnection();
      case 500:
        return const NetworkExceptions.internalServerError();
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
          responseCode,
          'Received invalid status code. body: $body',
        );
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
            case DioErrorType.connectTimeout:
            case DioErrorType.other:
            case DioErrorType.receiveTimeout:
            case DioErrorType.sendTimeout:
              networkExceptions = NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.response:
              networkExceptions = NetworkExceptions.handleResponse(
                error.response?.statusCode,
                error.response?.data,
              );
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = '';
    networkExceptions.when(notImplemented: () {
      errorMessage = 'Not Implemented';
    }, internalServerError: () {
      errorMessage = 'Internal Server Error';
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = 'Service unavailable';
    }, methodNotAllowed: () {
      errorMessage = 'Method Allowed';
    }, badRequest: () {
      errorMessage = 'Bad request';
    }, unauthorizedRequest: () {
      errorMessage = 'Unauthorized request';
    }, unexpectedError: () {
      errorMessage = 'Unexpected error occurred';
    }, noInternetConnection: () {
      errorMessage = 'No internet connection';
    }, conflict: () {
      errorMessage = 'Error due to a conflict';
    }, unableToProcess: () {
      errorMessage = 'Unable to process the data';
    }, defaultError: (int? code, String? error) {
      errorMessage = error ?? 'Unexpected error occurred';
    }, formatException: () {
      errorMessage = 'Unexpected error occurred';
    }, notAcceptable: () {
      errorMessage = 'Not acceptable';
    });
    return errorMessage;
  }
}
