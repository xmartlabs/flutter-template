import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/section/error_handler/error_handler_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_cubit.freezed.dart';
part 'signin_state.dart';

class SignInCubit extends Cubit<SignInBaseState> {
  final GeneralErrorHandler _errorHandler;
  final SessionRepository _sessionRepository = DiProvider.get();

  SignInCubit(this._errorHandler)
      : super(
          SignInBaseState.state(
            email: 'hi@xmartlabs.com',
            password: 'xmartlabs',
            error: '',
          ),
        );

  void changeEmail(String email) => emit(state.copyWith(email: email));

  void changePassword(String email) => emit(state.copyWith(email: email));

  Future<void> login() async {
    final result = await _sessionRepository
        .signInUser(email: state.email!, password: state.password!)
        .mapToResult();

    if (result.isFailure) {
      emit(
        state.copyWith(error: 'Error ${result.error}'),
      );
      _errorHandler.handleError(result.error);
    }
  }
}
