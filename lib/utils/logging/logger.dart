import 'package:e_store_app/utils/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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

  /// warnig Snakbar
  static warningSnakebar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: EStoreColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(20),
        icon: Icon(Iconsax.warning_2, color: EStoreColors.white));
  }

  /// success Snakbar
  static successSnakebar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: EStoreColors.white,
      backgroundColor: EStoreColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(10),
      icon: Icon(Iconsax.check, color: EStoreColors.white),
    );
  }

  /// Error Snakebar
  static errorSnakebar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: EStoreColors.white,
        backgroundColor: Colors.red.shade50,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(20),
        icon: Icon(Iconsax.warning_2, color: EStoreColors.white));
  }
}
