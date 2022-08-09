import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/core/common/store/store.dart';

class SecuredStorageSourceOfTruth<T> implements SourceOfTruth<T> {
  FlutterSecureStorage secureStorage;

  final String key;
  final Serializer<T> serializer;

  final _streamController = StreamController<T?>.broadcast();

  T? _cachedValue;

  @override
  late Stream<T?> Function() reader;
  @override
  late Future<void> Function(T?) writer;

  SecuredStorageSourceOfTruth(this.key, this.secureStorage, this.serializer) {
    reader = () async* {
      final stringValue = await secureStorage.read(key: key);
      _cachedValue =
          stringValue == null ? null : serializer.decode(stringValue);
      yield _cachedValue;
      yield* _streamController.stream;
    };
    writer = (value) async {
      _cachedValue = value;
      _streamController.add(value);
    };
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
