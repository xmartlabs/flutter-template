import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/core/common/store/secure_storage_cached_source.dart';
import 'package:flutter_template/core/common/store/store.dart';
import 'package:flutter_template/core/model/user.dart';

class AuthLocalSource {
  static const _storageAuthPrefix = 'AuthLocalSource';
  static const _keyToken = '$_storageAuthPrefix.token';
  static const _keyUser = '$_storageAuthPrefix.user';

  final SourceOfTruth<String> _userTokenStorage;
  final SourceOfTruth<User> _userStorage;

  AuthLocalSource(FlutterSecureStorage storage)
      : _userTokenStorage =
            SecuredStorageSourceOfTruth(_keyToken, storage, StringSerializer()),
        _userStorage =
            SecuredStorageSourceOfTruth(_keyUser, storage, UserSerializer());

  Stream<String?> getUserToken() => _userTokenStorage.reader();

  Stream<User?> getUser() => _userStorage.reader();

  Future<void> saveUserToken(String? token) => _userTokenStorage.writer(token);

  Future<void> saveUserInfo(User? user) => _userStorage.writer(user);
}

class UserSerializer extends Serializer<User> {
  @override
  User decode(String userJson) => User.fromJson(json.decode(userJson));

  @override
  String encode(User user) => json.encode(user.toJson());
}
