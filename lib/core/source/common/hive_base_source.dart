import 'dart:async';
import 'dart:convert';

import 'package:dartx/dartx.dart';
import 'package:hive/hive.dart';

abstract class HiveBaseSource<Model, Key> {
  final Map<String, dynamic> Function(Model) dbParser;
  final Model Function(Map<String, dynamic>) modelParser;
  late final Box<String> _box;

  HiveBaseSource({required this.dbParser, required this.modelParser});

  Future<void> init() async {
    _box = await Hive.openBox<String>(Model.toString());
  }

  Future<Model> putElement(
    Key key,
    Model response,
  ) async {
    await _box.put(
      key,
      jsonEncode(dbParser(response)),
    );
    return response;
  }

  List<Model> putAllElements(Map<Key, Model> entries) {
    _box.putAll(
      entries.mapValues(
        (entry) => jsonEncode(dbParser(entry.value)),
      ),
    );
    return getElements();
  }

  Future<void> deleteElement(Key key) => _box.delete(key);

  Future<void> deleteAllElements() => _box.clear();

  Model? getElement(
    Key key,
  ) {
    final data = _box.get(key);
    return data == null
        ? null
        : modelParser(
            jsonDecode(
              data,
            ),
          );
  }

  Stream<Model> getElementStream(
    Key key,
  ) async* {
    final element = getElement(key);
    if (element != null) {
      yield element;
    }
    yield* _box.watch(key: key).map(
          (event) => modelParser(jsonDecode(event.value)),
        );
  }

  List<Model> getElements() =>
      _box.values.map((e) => modelParser(jsonDecode(e))).toList();

  Stream<List<Model>> getElementsStream() async* {
    yield getElements();
    yield* _box.watch().map(
          (event) => getElements(),
        );
  }
}
