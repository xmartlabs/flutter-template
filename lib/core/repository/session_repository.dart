import 'dart:async';

import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';

class SessionRepository {
  final AuthLocalSource _authLocalSource;
  final AuthRemoteSource _authRemoteSource;

  SessionRepository(this._authLocalSource, this._authRemoteSource);

  Stream<AuthenticationStatus> get status =>
      _authLocalSource.getUserToken().map((token) => token == null
          ? AuthenticationStatus.unauthenticated
          : AuthenticationStatus.authenticated);

  Stream<User?> getUserInfo() => _authLocalSource.getUser();

  Future<void> signInUser(String email, String password) async {
    final response = await _authRemoteSource.signIn(email, password);
    await _authLocalSource.saveUserToken(response.token);
    await _authLocalSource
        .saveUserInfo(User(name: response.name, email: response.email));
  }

  Future<void> logOut() async {
    await _authLocalSource.saveUserToken(null);
    await _authLocalSource.saveUserInfo(null);
  }
}
