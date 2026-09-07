part of 'signin_cubit.dart';

@freezed
abstract class SignInBaseState with _$SignInBaseState {
  const factory SignInBaseState.state({
    required String? email,
    required String? password,
    required String error,
  }) = SignInState;
}
