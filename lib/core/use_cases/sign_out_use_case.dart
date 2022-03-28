import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/core/use_cases/base_use_case.dart';

class SignOutUseCase extends BaseVoidFutureUseCase<void> {
  final SessionRepository _sessionRepository;

  SignOutUseCase(this._sessionRepository);

  @override
  Future<void> execute() => _sessionRepository.logOut();
}
