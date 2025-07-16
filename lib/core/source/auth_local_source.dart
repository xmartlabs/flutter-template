import 'dart:convert';

import 'package:flutter_template/core/common/store/secure_storage_cached_source.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/source/common/local_shared_preferences_storage.dart';
import 'package:stock/stock.dart';

class AuthLocalSource {
  static const _storageAuthPrefix = 'AuthLocalSource';
  static const _keyToken = '$_storageAuthPrefix.token';
  static const _keyUser = '$_storageAuthPrefix.user';

  late SourceOfTruth<String, String> _userTokenStorage;
  late SourceOfTruth<String, User> _userStorage;

  AuthLocalSource(LocalSharedPreferencesStorage storage) {
    final secureStorage = SharedPreferencesSourceOfTruth(storage);
    _userTokenStorage = secureStorage;
    _userStorage = secureStorage.mapToUsingMapper(UserStockTypeMapper());
  }

  Stream<String?> getUserToken() => _userTokenStorage.reader(_keyToken);

  Stream<User?> getUser() => _userStorage.reader(_keyUser);

  Future<void> saveUserToken(String? token) =>
      _userTokenStorage.write(_keyToken, token);

  Future<void> saveUserInfo(User? user) => _userStorage.write(_keyUser, user);
}

class UserStockTypeMapper implements StockTypeMapper<String, User> {
  @override
  User fromInput(String value) => User.fromJson(json.decode(value));

  @override
  String fromOutput(User value) => json.encode(value.toJson());
}
