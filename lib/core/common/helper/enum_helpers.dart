import 'package:dartx/dartx.dart';

T? enumFromString<T>(Iterable<T> values, String value) =>
    values.firstOrNullWhere((type) => type.toString().split('.').last == value);
