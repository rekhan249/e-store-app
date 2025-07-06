import 'package:logger/logger.dart';

class LoggerHelper {
  static final Logger _logger =
      Logger(printer: PrettyPrinter(), level: Level.debug);

  /// debugging processing
  static void debug(String message) {
    _logger.d(message);
  }

  /// information processing
  static void info(String message) {
    _logger.i(message);
  }

  /// warning processing
  static void warning(String message) {
    _logger.w(message);
  }

  /// error processing
  static void error(String message, [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }
}
