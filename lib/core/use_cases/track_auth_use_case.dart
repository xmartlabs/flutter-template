import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/core/use_cases/base_use_case.dart';

class TrackAuthUseCase extends BaseVoidStreamUseCase<AuthenticationStatus> {
  final SessionRepository _sessionRepository;

  TrackAuthUseCase(this._sessionRepository);

  @override
  Stream<AuthenticationStatus> stream() => _sessionRepository.status;
}
