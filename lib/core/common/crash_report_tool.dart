import 'package:logger/logger.dart';

// An example of crashlytics impl can be found https://gist.github.com/mirland/70fa48154e56ae9b16279dcffc7ac4ba
abstract class CrashReportTool {
  Future init();

  Future logNonFatal(LogEvent event);

  Future logFatal(dynamic error, StackTrace? stackTrace);
}

class NoOpsCrashReportTool extends CrashReportTool {
  @override
  Future init() async {}

  @override
  Future logFatal(error, StackTrace? stackTrace) async {}

  @override
  Future logNonFatal(LogEvent event) async {}
}
