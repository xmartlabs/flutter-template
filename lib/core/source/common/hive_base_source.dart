import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter_template/core/source/common/local_storage.dart';
import 'package:hive/hive.dart';
import 'package:mutex/mutex.dart';
import 'package:rxdart/rxdart.dart';

abstract class HiveBaseSource<Key, Model> implements LocalStorage<Key, Model> {
  final String Function(Model) dbParser;
  final Model Function(String) modelParser;
  final Mutex _mutex = Mutex();
  Box<String>? _box;

  HiveBaseSource({required this.dbParser, required this.modelParser});

  Future<Box<String>> getBox() async => _mutex.protect(() async {
        if (_box != null && _box!.isOpen) {
          return _box!;
        } else {
          _box = await Hive.openBox<String>(Model.toString());
          return _box!;
        }
      });

  Future<T> withBox<T>(Future<T> Function(Box<String>) body) async =>
      body(await getBox());

  @override
  Future<Model> putElement(
    Key key,
    Model response,
  ) async =>
      withBox((box) async {
        await box.put(
          key,
          dbParser(response),
        );
        return response;
      });

  @override
  Future<List<Model>> putAllElements(Map<Key, Model> entries) =>
      withBox((box) async {
        await box.putAll(
          entries.mapValues(
            (entry) => dbParser(entry.value),
          ),
        );
        return getElements();
      });

  @override
  Future<void> deleteElement(Key key) => withBox((box) => box.delete(key));

  @override
  Future<void> deleteAllElements() => withBox((box) => box.clear());

  @override
  Future<Model?> getElement(
    Key key,
  ) =>
      withBox((box) async {
        final data = box.get(key);
        return data == null ? null : modelParser(data);
      });

  @override
  Stream<Model?> getElementStream(
    Key key,
  ) async* {
    final box = await getBox();
    yield await getElement(key);
    yield* box.watch(key: key).map(
          (event) => modelParser(event.value),
        );
  }

  @override
  Future<List<Model>> getElements() => withBox(
        (box) => Future.value(
          box.values.map((e) => modelParser(e)).toList(),
        ),
      );

  @override
  Stream<List<Model>> getElementsStream() async* {
    final box = await getBox();
    yield await getElements();
    yield* box.watch().flatMap(
          (event) => Stream.fromFuture(getElements()),
        );
  }
}
