part of 'splash_bloc.dart';

@freezed
class SplashBaseState with _$SplashBaseState {
  const factory SplashBaseState.state(
      {required AuthenticationStatus authenticationStatus}) = SplashState;
}
