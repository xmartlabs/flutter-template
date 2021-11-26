import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/repository/session_repository.dart';

import 'base_use_case.dart';

class GetUserInfoUseCase extends BaseFutureUseCase<void, User> {
  final SessionRepository _sessionRepository;

  GetUserInfoUseCase(this._sessionRepository);

  @override
  Future<User> execute(void params) async {
    var user = await _sessionRepository.getUserInfo();
    return (user)!;
  }
}
