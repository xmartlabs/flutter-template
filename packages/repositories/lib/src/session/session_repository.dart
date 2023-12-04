import 'dart:async';

import 'package:models/models.dart';
import 'package:repositories/src/db/app_database.dart';
import 'package:repositories/src/session/auth_local_source.dart';
import 'package:repositories/src/session/auth_remote_source.dart';

class SessionRepository {
  final AuthLocalSource _authLocalSource;
  final AuthRemoteSource _authRemoteSource;
  final AppDatabase _appDataBase;

  SessionRepository(
    this._appDataBase,
    this._authLocalSource,
    this._authRemoteSource,
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
    await _appDataBase.clearAllTables();
    await _authLocalSource.saveUserToken(null);
    await _authLocalSource.saveUserInfo(null);
  }
}

enum AuthenticationStatus { authenticated, unauthenticated }
