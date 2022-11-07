import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stock/stock.dart';

class SecuredStorageSourceOfTruth extends CachedSourceOfTruth<String, String> {
  final FlutterSecureStorage _secureStorage;

  SecuredStorageSourceOfTruth(this._secureStorage);

  @override
  Stream<String?> reader(String key) async* {
    final stringValue = await _secureStorage.read(key: key);
    setCachedValue(key, stringValue);
    yield* super.reader(key);
  }

  @override
  @protected
  Future<void> write(String key, String? value) async {
    await super.write(key, value);
    await _secureStorage.write(key: key, value: value);
  }
}
