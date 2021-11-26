part of 'signin_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.changeEmail({required String email}) =
      ChangeEmailSignInEvent;

  const factory SignInEvent.changePassword({required String password}) =
      ChangePasswordSignInEvent;

  const factory SignInEvent.login() = LoginSignInEvent;
}
