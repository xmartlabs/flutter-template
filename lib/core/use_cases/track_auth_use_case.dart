import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/core/use_cases/base_use_case.dart';

class TrackAuthUseCaseParam {}

class TrackAuthUseCase
    extends BaseStreamUseCase<TrackAuthUseCaseParam, AuthenticationStatus> {
  final SessionRepository _sessionRepository;

  TrackAuthUseCase(this._sessionRepository);

  @override
  Stream<AuthenticationStatus> stream(TrackAuthUseCaseParam params) =>
      _sessionRepository.status;
}
