import 'package:e_store_app/data/repositories/authentic_repository.dart';
import 'package:e_store_app/features/authentication/screens/password_config/reset_password.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/helpers/network_manage.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:e_store_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController {
  static ForgetPassController get instance => Get.find();

  /// variables
  final email = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send reset pass through email
  sendPasswordResetEmail() async {
    try {
      /// start loading
      FullScreenLoader.openLoadingDialog(
          "We are processing yours informaton", ImageStrings.animalIcon);

      /// check internet connectivity
      final isConnected = await NetworkManage.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      await AuthenticRepository.instance
          .sendEmailResetPassword(email.text.trim());
      FullScreenLoader.stopLoading();
      LoggerHelper.successSnakebar(
          title: "Email sent",
          message: "Email link has been sent to yours email");
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.stopLoading();
      LoggerHelper.errorSnakebar(title: "Oh snap", message: e.toString());
    }
  }

  /// resend reset pass through email
  resendPasswordResetEmail(String email) async {
    try {
      /// start loading
      FullScreenLoader.openLoadingDialog(
          "We are processing yours informaton", ImageStrings.animalIcon);

      /// check internet connectivity
      final isConnected = await NetworkManage.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      await AuthenticRepository.instance.sendEmailResetPassword(email);
      FullScreenLoader.stopLoading();
      LoggerHelper.successSnakebar(
          title: "Email sent",
          message: "Email link has been sent to yours email");
    } catch (e) {
      FullScreenLoader.stopLoading();
      LoggerHelper.errorSnakebar(title: "Oh snap", message: e.toString());
    }
  }
}
