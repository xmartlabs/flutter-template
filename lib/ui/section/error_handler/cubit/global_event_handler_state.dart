part of 'global_event_handler_cubit.dart';

@freezed
sealed class GlobalEventHandlerState with _$GlobalEventHandlerState {
  const factory GlobalEventHandlerState.idle() = IdleGlobalEventHandlerState;

  const factory GlobalEventHandlerState.error(
    GlobalEventHandlerStateError error,
  ) = ErrorGlobalEventHandlerState;

  const factory GlobalEventHandlerState.loading() =
      LoadingGlobalEventHandlerState;
}

@Freezed(equal: false)
sealed class GlobalEventHandlerStateError with _$GlobalEventHandlerStateError {
  const factory GlobalEventHandlerStateError.unknownError(
    Object? error, [
    VoidCallback? retry,
  ]) = UnknownError;

  const factory GlobalEventHandlerStateError.internetError([
    VoidCallback? retry,
  ]) = InternetError;

  const factory GlobalEventHandlerStateError.generalError(
    String? title,
    String description, [
    VoidCallback? retry,
  ]) = GeneralError;
}
