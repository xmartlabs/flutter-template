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
      await dotEnv.load(fileName: path, isOptional: true);
      completer.complete(dotEnv.env);
    },
    (e, s) {
      if (ignoreErrors) {
        completer.complete({});
      } else {
        Logger.d('$path file is not valid.', e);
        completer.completeError(e, s);
      }
    },
  );
  return completer.future;
}
