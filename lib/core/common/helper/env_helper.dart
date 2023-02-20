import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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
      Map<String, String> envMap = {};
      // assetExist is called to avoid unnecessary breakpoint exceptions when
      // the debugger is enabled.
      // The check is done only in debug to avoid performance issues
      // https://github.com/java-james/flutter_dotenv/issues/79
      if (!kDebugMode || await _assetExists(path)) {
        await dotEnv.load(fileName: path);
        envMap = dotEnv.env;
      }
      completer.complete(envMap);
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

Future<bool> _assetExists(String assetPath) async {
  try {
    final data = await rootBundle.load(assetPath);
    return data.lengthInBytes > 0;
  } catch (e) {
    return false;
  }
}
