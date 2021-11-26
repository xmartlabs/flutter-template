part of 'splash_bloc.dart';

@freezed
class SplashBaseEvent with _$SplashBaseEvent {
  const factory SplashBaseEvent.changeAuth(
      {required AuthenticationStatus authenticationStatus}) = SplashEvent;
}
