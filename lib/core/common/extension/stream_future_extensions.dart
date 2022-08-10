import 'package:flutter_template/core/common/logger.dart';
import 'package:flutter_template/core/common/result.dart';
import 'package:rxdart/rxdart.dart';

extension StreamExtensions<T> on Stream<T> {
  Stream<Result<T>> mapToResult() =>
      map(Result.success).onErrorReturnWith((error, stacktrace) {
        Logger.w('Stream error', error, stacktrace);
        return Result.failure<T>(error);
      });

  Stream<T> filterSuccess([Function(Object?)? errorHandler]) =>
      handleError((error, stacktrace) {
        Logger.w('Stream error', error, stacktrace);
        errorHandler?.call(error);
      });
}

extension FutureExtensions<T> on Future<T> {
  Future<Result<T>> mapToResult() async {
    try {
      return Result.success(await this);
    } catch (error, stacktrace) {
      Logger.w('Future error', error, stacktrace);
      return Result.failure<T>(error);
    }
  }

  Future<T?> filterSuccess([Function(Object?)? errorHandler]) async {
    try {
      return await this;
    } catch (error, stacktrace) {
      Logger.w('Future error', error, stacktrace);
      errorHandler?.call(error);
      return null;
    }
  }
}
