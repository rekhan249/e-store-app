import 'package:e_store_app/features/authentication/screens/login/login_screen.dart';
import 'package:e_store_app/features/authentication/screens/onboarding.dart';
import 'package:e_store_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_store_app/navigate_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigateMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      /// local storage work
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnboardingScreen());
    }
  }

  /// ------------------- Sign Up & Sign In with email and password
  /// [EmailAuthentication] - Sign-In
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code).message!;
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth').message!;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

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
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  /// [Email verification] - mail verify
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code).message!;
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth').message!;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  ///
  /// [Email verification] - mail verify
  Future<void> sendEmailResetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code).message!;
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth').message!;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  /// [Logout] - loggingout from app
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code).message!;
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth').message!;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  /// Signin with google-signin
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // final GoogleSignIn? googleSignIn;
      final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleSignIn!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code).message!;
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth').message!;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
