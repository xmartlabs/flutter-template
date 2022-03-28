import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/core/model/user.dart';

class AuthLocalSource {
  static const _storageAuthPrefix = 'AuthLocalSource';
  static const _keyToken = '$_storageAuthPrefix.token';
  static const _keyUser = '$_storageAuthPrefix.user';
  final FlutterSecureStorage _storage;

  AuthLocalSource(this._storage);

  Future<String?> getUserToken() => _storage.read(key: _keyToken);

  Future<User?> getUser() async {
    final userJson = await _storage.read(key: _keyUser);
    return (userJson == null) ? null : User.fromJson(json.decode(userJson));
  }

  Future<void> saveUserToken(String? token) =>
      _storage.write(key: _keyToken, value: token);

  Future<void> saveUserInfo(User? user) =>
      _storage.write(key: _keyUser, value: json.encode(user?.toJson()));
}
