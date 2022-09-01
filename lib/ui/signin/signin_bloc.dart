import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/common/helper/future_helpers.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/section/error_handler/error_handler_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_bloc.freezed.dart';

part 'signin_event.dart';

part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SessionRepository _sessionRepository = DiProvider.get();

  // TODO: use it
  // ignore: unused_field
  final GeneralErrorHandler _errorHandler;

  SignInBloc(this._errorHandler)
      : super(const SignInState(
            email: 'hi@xmartlabs.com', password: 'xmartlabs', error: '')) {
    on<SignInEvent>(eventHandler);
  }

  Future<void> eventHandler(
          SignInEvent event, Emitter<SignInState> emitter) async =>
      await event.when<Future>(
          changeEmail: (email) =>
              wrapInFuture(() => emitter(state.copyWith(email: email))),
          changePassword: (password) =>
              wrapInFuture(() => emitter(state.copyWith(password: password))),
          login: () => _performSignInEvent(emitter));

  Future<void> _performSignInEvent(Emitter<SignInState> emitter) async {
    final result = await _sessionRepository
        .signInUser(email: state.email!, password: state.password!)
        .mapToResult();
    emitter(
      state.copyWith(error: result.isSuccess ? '' : 'Error ${result.error}'),
    );
  }
}
