part of 'global_event_handler_cubit.dart';

@freezed
class GlobalEventHandlerState with _$GlobalEventHandlerState {
  const factory GlobalEventHandlerState.idle() = IdleGlobalEventHandlerState;

  const factory GlobalEventHandlerState.error(
    GlobalEventHandlerStateError error,
  ) = ErrorGlobalEventHandlerState;

  const factory GlobalEventHandlerState.loading() =
      LoadingGlobalEventHandlerState;
}

@Freezed(equal: false)
class GlobalEventHandlerStateError with _$GlobalEventHandlerStateError {
  const factory GlobalEventHandlerStateError.unknownError(
    Object? error, [
    VoidCallback? retry,
  ]) = _UnknownError;

  const factory GlobalEventHandlerStateError.internetError([
    VoidCallback? retry,
  ]) = _InternetError;

  const factory GlobalEventHandlerStateError.generalError(
    String? title,
    String description, [
    VoidCallback? retry,
  ]) = _GeneralError;
}
