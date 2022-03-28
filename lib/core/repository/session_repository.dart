import 'dart:async';

import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';

class SessionRepository {
  final AuthLocalSource _authLocalSource;
  final AuthRemoteSource _authRemoteSource;

  final _authController = StreamController<AuthenticationStatus>.broadcast();

  SessionRepository(this._authLocalSource, this._authRemoteSource);

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unknown;
    final token = await _authLocalSource.getUserToken();
    if (token == null) {
      yield AuthenticationStatus.unauthenticated;
    } else {
      yield AuthenticationStatus.authenticated;
    }
    yield* _authController.stream;
  }

  Future<User?> getUserInfo() => _authLocalSource.getUser();

  Future<void> signInUser(String email, String password) async {
    final response = await _authRemoteSource.signIn(email, password);
    await _authLocalSource.saveUserToken(response.token);
    await _authLocalSource
        .saveUserInfo(User(name: response.name, email: response.email));
    _authController.add(AuthenticationStatus.authenticated);
  }

  Future<void> logOut() async {
    await _authLocalSource.saveUserToken(null);
    await _authLocalSource.saveUserInfo(null);
    _authController.add(AuthenticationStatus.unauthenticated);
  }
}
