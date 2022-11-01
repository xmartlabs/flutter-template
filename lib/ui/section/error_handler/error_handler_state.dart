part of 'error_handler_cubit.dart';

@freezed
class ErrorHandlerState with _$ErrorHandlerState {
  const factory ErrorHandlerState.init() = _InitErrorHandlerState;

  const factory ErrorHandlerState.unknownError(
    Object? error, [
    VoidCallback? retry,
  ]) = _UnknownErrorHandlerState;

  const factory ErrorHandlerState.internetError([VoidCallback? retry]) =
      _InternetErrorHandlerState;

  const factory ErrorHandlerState.generalError(
    String? title,
    String description, [
    VoidCallback? retry,
  ]) = _GeneralErrorHandlerState;
}
