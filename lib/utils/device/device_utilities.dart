import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DeviceUtilities {
  /// hideKeyboard function
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// setStatusbarColor function
  static Future<void> setStatusbarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color));
  }

  /// isLandScapeOrientation function
  static bool isLandScapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// isPortraitOrientation function
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  /// setFullScreen function
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  /// getScreenHeight function
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// getScreenWidth function
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// getDevicePixelRatio function
  static double getDevicePixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  /// getStatusBarHeight function
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  /// getBottomNavigationBarHeight function
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// getAppBarHeight function
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// getKeyBoardHeight function
  static double getKeyBoardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  /// isKeyboardVisible function
  static Future<bool> isKeyboardVisible() async {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  /// isPhysicalDevice function
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// vibrate function
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// vibrate function
  static Future<void> setPreferredOrientation(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// hideStatusbar function
  static void hideStatusbar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// showStatusbar function
  static void showStatusbar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  /// hasInternetConnection function
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Check IOS Function
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Check isAndroid Function
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  /// Check isAndroid Function
  static void lancherUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "Could not lanch $url";
    }
  }
}
