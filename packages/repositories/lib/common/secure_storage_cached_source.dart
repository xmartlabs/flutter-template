import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/common/local_shared_preferences_storage.dart';
import 'package:stock/stock.dart';

class SharedPreferencesSourceOfTruth
    extends CachedSourceOfTruth<String, String> {
  final LocalSharedPreferencesStorage _storage;

  SharedPreferencesSourceOfTruth(this._storage);

  @override
  Stream<String?> reader(String key) async* {
    final stringValue = await _storage.read(key: key);
    setCachedValue(key, stringValue);
    yield* super.reader(key);
  }

  @override
  @protected
  Future<void> write(String key, String? value) async {
    await _storage.write(key: key, value: value);
    await super.write(key, value);
  }
}
