import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/core/common/logger.dart';

Future<Map<String, String>> loadEnvs(
  String path, [
  bool ignoreErrors = true,
]) async {
  final dotEnv = DotEnv();
  final completer = Completer<Map<String, String>>();
  // ignore: unawaited_futures
  runZonedGuarded(
    () async {
      await dotEnv.load(fileName: path);
      completer.complete(dotEnv.env);
    },
    (e, s) {
      Logger.d('$path file is not valid.', e);
      if (ignoreErrors) {
        completer.complete({});
      } else {
        completer.completeError(e, s);
      }
    },
  );
  return completer.future;
}
