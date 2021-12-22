import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/core/use_cases/base_use_case.dart';

class SignInUseCaseParams {
  final String email;
  final String password;

  SignInUseCaseParams({required this.email, required this.password});
}

class SignInUseCase extends BaseFutureUseCase<SignInUseCaseParams, void> {
  final SessionRepository _sessionRepository;

  SignInUseCase(this._sessionRepository);

  @override
  Future<void> execute(SignInUseCaseParams params) =>
      _sessionRepository.signInUser(params.email, params.password);
}
