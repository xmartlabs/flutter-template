part of 'welcome_cubit.dart';

@freezed
class WelcomeBaseState with _$WelcomeBaseState {
  const factory WelcomeBaseState.state({
    @Default(null) String? userName,
    @Default([]) List<Task> tasks,
  }) = WelcomeState;
}
