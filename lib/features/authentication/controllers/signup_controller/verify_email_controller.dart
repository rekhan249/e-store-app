import 'dart:async';

import 'package:e_store_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_store_app/data/repositories/authentic_repository.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send email whenever verify screen appear and set timer for timeout
  @override
  void onInit() {
    sendVerifyEmail();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Sent email verificagtion link
  sendVerifyEmail() async {
    try {
      await AuthenticRepository.instance.sendEmailVerification();
      LoggerHelper.successSnakebar(
          title: "Email sent",
          message: "Please check your inbox and verify yours email");
    } catch (e) {
      LoggerHelper.errorSnakebar(title: "Oh Snap", message: e.toString());
    }
  }

  /// Timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(() => SuccessScreen(
                image: ImageStrings.staticSuccessIllustration,
                title: TextStrings.yourAccountCreateTitle,
                subTitle: TextStrings.yourAccountCreateSubTitle,
                onPressed: () => AuthenticRepository.instance.screenRedirect(),
              ));
        }
      },
    );
  }

  /// Manually check if email verified
  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: ImageStrings.staticSuccessIllustration,
            title: TextStrings.yourAccountCreateTitle,
            subTitle: TextStrings.yourAccountCreateSubTitle,
            onPressed: () => AuthenticRepository.instance.screenRedirect(),
          ));
    }
  }
}
