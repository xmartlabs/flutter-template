part of 'signin_bloc.dart';

@freezed
class SignInBaseState with _$SignInBaseState {
  const factory SignInBaseState.state({
    required String? email,
    required String? password,
    required String error,
  }) = SignInState;
}
