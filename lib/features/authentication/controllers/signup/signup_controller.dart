import 'package:e_store_app/data/repositories/authentic_repository.dart';
import 'package:e_store_app/data/repositories/user/user_repository.dart';
import 'package:e_store_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_store_app/models/signup_model.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/helpers/network_manage.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:e_store_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final obscurePassword = true.obs;
  final privacyPolicy = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /// SignUp function
  Future<void> signup() async {
    try {
      /// start loading
      FullScreenLoader.openLoadingDialog(
          "We are processing yours informaton", ImageStrings.animalIcon);

      /// check internet connectivity
      final isConnected = await NetworkManage.instance.isConnected();
      if (!isConnected) return;

      /// form validation
      if (!signUpFormKey.currentState!.validate()) return;

      /// privacy policy
      if (!privacyPolicy.value) {
        LoggerHelper.warningSnakebar(
            title: "Accept privacy policy",
            message:
                "In order to create acoout, you must have to read and accept privacy policy");
      }

      /// firebase create user and save data
      final userCredential = await AuthenticRepository.instance
          .registedWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      /// save and authenticate user data on firebase
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNum: phoneNo.text.trim(),
          profilePicture: "");

      final userRepo = Get.put(UserRepository());
      userRepo.saveUserRecord(newUser);

      /// show successfull message
      LoggerHelper.successSnakebar(
          title: "Congrate", message: "Yours account had been created");

      /// Move to for email verification
      Get.to(() => VerifyEmailScreen());
    } catch (e) {
      /// catch and show the generic error to users
      LoggerHelper.errorSnakebar(title: "Oh Snap!", message: e.toString());
    } finally {
      /// Remove loader
      FullScreenLoader.stopLoading();
    }
  }
}
