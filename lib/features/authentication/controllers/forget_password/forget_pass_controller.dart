import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController {
  static ForgetPassController get instance => Get.find();

  /// variables
  final email = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send reset pass through email
  sendPasswordResetEmail() async {
    try {} catch (e) {}
  }

  /// resend reset pass through email
  resendPasswordResetEmail() async {
    try {} catch (e) {}
  }
}
