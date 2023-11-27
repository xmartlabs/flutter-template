import 'dart:async';

import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:flutter_template/core/source/project_local_source.dart';

class SessionRepository {
  final AuthLocalSource _authLocalSource;
  final AuthRemoteSource _authRemoteSource;
  final ProjectLocalSource _projectLocalSource;

  SessionRepository(
    this._authLocalSource,
    this._authRemoteSource,
    this._projectLocalSource,
  );

  Stream<AuthenticationStatus> get status =>
      _authLocalSource.getUserToken().map(
            (token) => token == null
                ? AuthenticationStatus.unauthenticated
                : AuthenticationStatus.authenticated,
          );

  Stream<User?> getUserInfo() => _authLocalSource.getUser();

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    final response = await _authRemoteSource.signIn(email, password);
    await _authLocalSource.saveUserToken(response.accessToken);
    await _authLocalSource.saveUserInfo(response.user);
  }

  Future<void> logOut() async {
    await _projectLocalSource.deleteAllElements();
    await _authLocalSource.saveUserToken(null);
    await _authLocalSource.saveUserInfo(null);
  }
}
