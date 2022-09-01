part of 'main_cubit.dart';

@freezed
class MainBaseState with _$MainBaseState {
  const factory MainBaseState.state(
      {@Default(null) AuthenticationStatus? authenticationStatus}) = _MainState;
}
