part of 'welcome_cubit.dart';

@freezed
class WelcomeBaseState with _$WelcomeBaseState {
  const factory WelcomeBaseState.state({required String? name}) = WelcomeState;
}
