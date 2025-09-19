import 'package:e_store_app/features/authentication/screens/login/login_screen.dart';
import 'package:e_store_app/features/authentication/screens/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticRepository extends GetxController {
  static AuthenticRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app lunch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  /// To show relevant screen
  screenRedirect() async {
    if (kDebugMode) {
      print(deviceStorage.read("isFirstTime"));
    }

    /// local storage work
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(() => OnboardingScreen());
  }

  /// ------------------- Sign Up & Sign In with email and password
  /// [EmailAuthentication] - Sign-In
  /// [EmailAuthentication] - Sign-Up
  Future<UserCredential> registedWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code).message!;
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth').message!;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    }
  }
}
