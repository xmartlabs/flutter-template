import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/ui/section/error_handler/general_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_handler_cubit.freezed.dart';

part 'error_handler_state.dart';

class ErrorHandlerCubit extends Cubit<ErrorHandlerState>
    with GeneralErrorHandler {
  ErrorHandlerCubit() : super(ErrorHandlerState.init());

  @override
  void handleError(Object? error, [VoidCallback? retry]) {
    if (error is DioError &&
        (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.receiveTimeout)) {
      emit(ErrorHandlerState.internetError());
    } else if (error is GeneralError) {
      emit(ErrorHandlerState.generalError(error.title, error.description));
    } else {
      emit(ErrorHandlerState.unknownError(error));
    }
  }
}

abstract class GeneralErrorHandler {
  void handleError(Object? error, [VoidCallback? retry]);
}
