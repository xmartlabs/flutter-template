import 'package:logger/logger.dart' as dart_log;
import 'package:logger/logger.dart';

abstract class Logger {
  static dart_log.Logger instance = dart_log.Logger(
    printer: PrettyPrinter(),
  );
}
