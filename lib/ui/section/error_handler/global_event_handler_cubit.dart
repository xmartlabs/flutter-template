import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/ui/section/error_handler/general_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_event_handler_cubit.freezed.dart';

part 'global_event_handler_state.dart';

class GlobalEventHandlerCubit extends Cubit<GlobalEventHandlerState>
    with GlobalEventHandler {
  GlobalEventHandlerCubit() : super(const GlobalEventHandlerState.idle());

  @override
  void handleError(Object? error, [VoidCallback? retry]) {
    if (error is DioError &&
        (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.receiveTimeout)) {
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

abstract class GlobalEventHandler {
  void handleError(Object? error, [VoidCallback? retry]);
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
