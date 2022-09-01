import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_cubit.freezed.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainBaseState> {
  final SessionRepository _sessionRepository = DiProvider.get();

  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  MainCubit() : super(MainBaseState.state()) {
    _authenticationStatusSubscription = _sessionRepository.status
        .filterSuccess()
        .listen((status) => emit(state.copyWith(authenticationStatus: status)));
  }

  @override
  Future<void> close() async {
    await _authenticationStatusSubscription.cancel();
    await super.close();
  }
}
