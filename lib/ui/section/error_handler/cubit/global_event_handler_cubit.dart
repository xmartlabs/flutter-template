import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_event_handler_cubit.freezed.dart';

part 'global_event_handler_state.dart';

class GlobalEventHandlerCubit extends Cubit<GlobalEventHandlerState>
    implements GlobalEventHandler {
  GlobalEventHandlerCubit() : super(const GlobalEventHandlerState.idle());

  @override
  void handleError(
    Object? error, [
    StackTrace? stackTrace,
    VoidCallback? retry,
  ]) {
    if (error is DioException &&
        (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.receiveTimeout)) {
      emit(
        const GlobalEventHandlerState.error(
          GlobalEventHandlerStateError.internetError(),
        ),
      );
    } else if (error is GeneralError) {
      emit(
        GlobalEventHandlerState.error(
          GlobalEventHandlerStateError.generalError(
            error.title,
            error.description,
          ),
        ),
      );
    } else {
      emit(
        GlobalEventHandlerState.error(
          GlobalEventHandlerStateError.unknownError(error),
        ),
      );
    }
  }

  @override
  void startLoading() => emit(const GlobalEventHandlerState.loading());

  @override
  void stopLoading() => emit(const GlobalEventHandlerState.idle());
}

abstract interface class GlobalEventHandler {
  void handleError(
    Object? error, [
    StackTrace? stackTrace,
    VoidCallback? retry,
  ]);
  void startLoading();
  void stopLoading();
}

//ignore: unused-code
extension GlobalEventExtension on GlobalEventHandler {
  Future<T> showLoading<T>(Future<T> action) async {
    startLoading();
    final response = await action;
    stopLoading();
    return response;
  }
}
