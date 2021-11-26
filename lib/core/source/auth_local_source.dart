import 'dart:convert';

import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalSource {
  static const _STORAGE_AUTH_PREFIX = 'AuthLocalSource';
  static const _KEY_TOKEN = '$_STORAGE_AUTH_PREFIX.token';
  static const _KEY_USER = '$_STORAGE_AUTH_PREFIX.user';
  final FlutterSecureStorage _storage;

  AuthLocalSource({required FlutterSecureStorage storage}) : _storage = storage;

  Future<String?> getUserToken() async => await _storage.read(key: _KEY_TOKEN);

  Future<User?> getUser() async {
    final userJson = await _storage.read(key: _KEY_USER);
    return (userJson == null) ? null : User.fromJson(json.decode(userJson));
  }

  Future<void> saveUserToken(String? token) async =>
      await _storage.write(key: _KEY_TOKEN, value: token);

  Future<void> saveUserInfo(User? user) async =>
      await _storage.write(key: _KEY_USER, value: json.encode(user?.toJson()));
}
