part of 'welcome_cubit.dart';

@freezed
class WelcomeBaseState with _$WelcomeBaseState {
  const factory WelcomeBaseState.state({
    @Default([]) List<Project> projects,
  }) = WelcomeState;
}
