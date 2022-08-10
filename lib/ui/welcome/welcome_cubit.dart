import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_cubit.freezed.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeBaseState> {
  final SessionRepository _sessionRepository = DiProvider.get();

  WelcomeCubit() : super(WelcomeBaseState.state(name: '')) {
    unawaited(_setUserInfo());
  }

  Future<void> logOut() => _sessionRepository.logOut().mapToResult();

  Future<void> _setUserInfo() async {
    // TODO: Handle errors
    final user = await _sessionRepository.getUserInfo().filterSuccess().first;
    if (user != null) {
      emit(state.copyWith(name: user.name));
    }
  }
}
