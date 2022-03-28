import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/common/future_helpers.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/use_cases/sign_in_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_bloc.freezed.dart';

part 'signin_event.dart';

part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase = DiProvider.get();

  SignInBloc()
      : super(const SignInState(
            email: 'testuser@xmartlabs.com', password: 'password', error: '')) {
    on<SignInEvent>(eventHandler);
  }

  Future<void> eventHandler(
          SignInEvent event, Emitter<SignInState> emitter) async =>
      await event.when<Future>(
          changeEmail: (email) =>
              wrapInFuture(() => emitter.call(state.copyWith(email: email))),
          changePassword: (password) => wrapInFuture(
              () => emitter.call(state.copyWith(password: password))),
          login: () => _performSignInEvent(emitter));

  Future<void> _performSignInEvent(Emitter<SignInState> emitter) async {
    final result = await _signInUseCase.executeAsResult(
        SignInUseCaseParams(email: state.email!, password: state.password!));

    if (result.isSuccess) {
      emitter.call(state.copyWith(error: ''));
    } else {
      emitter.call(state.copyWith(error: 'Error ${result.error}'));
    }
  }
}
