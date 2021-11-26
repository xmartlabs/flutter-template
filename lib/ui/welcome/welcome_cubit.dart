import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/use_cases/get_user_info_use_case.dart';
import 'package:flutter_template/core/use_cases/sign_out_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_cubit.freezed.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeBaseState> {
  final GetUserInfoUseCase _getUserInfoUseCase = DiProvider.instance.get();
  final SignOutUseCase _signOutUseCase = DiProvider.instance.get();

  WelcomeCubit() : super(WelcomeBaseState.state(name: '')) {
    unawaited(_setUserInfo());
  }

  Future<void> logOut() =>
      _signOutUseCase.executeAsResult(SignOutUseCaseParams());

  Future<void> _setUserInfo() async {
    // TODO: Handle errors
    final user = (await _getUserInfoUseCase.executeAsResult(null)).data;
    if (user != null) {
      emit(state.copyWith(name: user.name));
    }
  }
}
