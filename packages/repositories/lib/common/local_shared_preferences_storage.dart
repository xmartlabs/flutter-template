import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPreferencesStorage {
  static const String _keyPrefix = 'SharedPreferencesProvider.';
  static const String _alreadyCleanDataKey = '${_keyPrefix}alreadyCleanData';

  final FlutterSecureStorage _flutterSecureStorage;

  final SharedPreferences _sharedPreferences;

  LocalSharedPreferencesStorage(
    this._flutterSecureStorage,
    this._sharedPreferences,
  );

  Future<LocalSharedPreferencesStorage> init() async {
    await _clearSecureStorageOnReinstall();
    return this;
  }

  Future<void> _clearSecureStorageOnReinstall() async {
    if (!(_sharedPreferences.getBool(_alreadyCleanDataKey) ?? false)) {
      await _flutterSecureStorage.deleteAll();
      await _sharedPreferences.setBool(_alreadyCleanDataKey, true);
    }
  }

  Future<String?> read({required String key}) =>
      _flutterSecureStorage.read(key: key);

  Future<void> write({required String key, required String? value}) =>
      _flutterSecureStorage.write(key: key, value: value);

  Future<void> delete({required String key}) =>
      _flutterSecureStorage.delete(key: key);

  Future<void> containsKey({required String key}) =>
      _flutterSecureStorage.containsKey(key: key);
}
