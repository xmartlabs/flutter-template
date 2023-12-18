import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/ui/section/error_handler/cubit/global_event_handler_cubit.dart';

class GlobalEventHandlerProvider extends ChangeNotifier
    implements GlobalEventHandler {
  // ignore: unused_field
  GlobalEventHandlerState _state = const GlobalEventHandlerState.idle();

  GlobalEventHandlerState get state => _state;

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
      _state = const GlobalEventHandlerState.error(
        GlobalEventHandlerStateError.internetError(),
      );
    } else if (error is GeneralError) {
      _state = GlobalEventHandlerState.error(
        GlobalEventHandlerStateError.generalError(
          error.title,
          error.description,
        ),
      );
    } else {
      _state = GlobalEventHandlerState.error(
        GlobalEventHandlerStateError.unknownError(error),
      );
    }
    notifyListeners();
  }

  @override
  void startLoading() {
    _state = const GlobalEventHandlerState.loading();
    notifyListeners();
  }

  @override
  void stopLoading() {
    _state = const GlobalEventHandlerState.idle();
    notifyListeners();
  }
}
