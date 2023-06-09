import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Map<String, String>> loadEnvs(
  String path, [
  bool ignoreErrors = true,
]) async {
  final completer = Completer<Map<String, String>>();
  await dotenv.load(fileName: path, isOptional: true);
  completer.complete(dotenv.env);
  return completer.future;
}
