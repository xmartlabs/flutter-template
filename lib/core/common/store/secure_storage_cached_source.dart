import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/core/common/store/store.dart';
import 'package:meta/meta.dart';

class SecuredStorageSourceOfTruth<T> extends CachedSourceOfTruth<T> {
  FlutterSecureStorage secureStorage;

  final String key;
  final Serializer<T> serializer;

  SecuredStorageSourceOfTruth(this.key, this.secureStorage, this.serializer);

  @override
  @protected
  Stream<T?> generateReader() async* {
    final stringValue = await secureStorage.read(key: key);
    setCachedValue(stringValue == null ? null : serializer.decode(stringValue));
    yield* super.generateReader();
  }

  @override
  @protected
  Future<void> generateWriter(T? value) async {
    await super.generateWriter(value);
    await secureStorage.write(
      key: key,
      value: value == null ? null : serializer.encode(value),
    );
  }
}

abstract class Serializer<T> {
  String encode(T t);

  T decode(String value);
}

class StringSerializer<T> implements Serializer<String> {
  @override
  String encode(String t) => t;

  @override
  String decode(String value) => value;
}
