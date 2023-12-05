import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Map<String, String>> loadEnvs(
  String path, [
  bool ignoreErrors = true,
]) async {
  final dotEnv = DotEnv();
  await dotEnv.load(fileName: path, isOptional: true);
  return dotEnv.env;
}
