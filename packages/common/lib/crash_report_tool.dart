import 'package:logger/logger.dart';

// An example of crashlytics impl can be found https://gist.github.com/mirland/70fa48154e56ae9b16279dcffc7ac4ba
abstract interface class CrashReportTool {
  Future init();

  Future logNonFatal(LogEvent event);

  Future logFatal(dynamic error, StackTrace? stackTrace);
}

final class NoOpsCrashReportTool extends CrashReportTool {
  @override
  // ignore: no-empty-block, avoid-redundant-async
  Future init() async {}

  @override
  // ignore: no-empty-block, avoid-redundant-async
  Future logFatal(error, StackTrace? stackTrace) async {}

  @override
  // ignore: no-empty-block, avoid-redundant-async
  Future logNonFatal(LogEvent event) async {}
}
