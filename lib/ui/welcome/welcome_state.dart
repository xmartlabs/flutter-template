part of 'welcome_cubit.dart';

@freezed
abstract class WelcomeBaseState with _$WelcomeBaseState {
  const factory WelcomeBaseState.state({@Default([]) List<Project> projects}) =
      WelcomeState;
}
