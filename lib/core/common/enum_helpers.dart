import 'package:collection/collection.dart';

T? enumFromString<T>(Iterable<T> values, String value) =>
    values.firstWhereOrNull((type) => type.toString().split('.').last == value);
