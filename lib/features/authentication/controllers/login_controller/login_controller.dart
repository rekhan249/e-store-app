import 'dart:developer';
import 'package:e_store_app/data/repositories/authentic_repository.dart';
import 'package:e_store_app/features/persionalization/controllers/user_controller_google.dart';
import 'package:e_store_app/navigate_menu.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/helpers/network_manage.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:e_store_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// variable
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final UserControllerGoogle userControllerGoogle =
      Get.put(UserControllerGoogle());

  @override
  void onInit() {
    email.text = localStorage.read("REMMEMBER_ME_EMAIL") ?? '';
    password.text = localStorage.read("REMMEMBER_ME_PASSWORD") ?? '';
    super.onInit();
  }

  /// SignUp function
  Future<void> signin() async {
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

      /// form validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      /// save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write("REMMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMMEMBER_ME_PASSWORD", password.text.trim());
      }

      /// firebase create user and save data
      await AuthenticRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// show successfull message
      LoggerHelper.successSnakebar(title: "Congrate");
      Get.to(() => NavigateMenu());
    } catch (e) {
      /// catch and show the generic error to users
      LoggerHelper.errorSnakebar(title: "Oh Snap!", message: e.toString());
    } finally {
      /// Remove loader
      FullScreenLoader.stopLoading();
    }
  }

  /// SignIn with google

  Future<void> signingoogle() async {
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

      /// firebase create user and save data
      final userCredential =
          await AuthenticRepository.instance.signInWithGoogle();
      await userControllerGoogle
          .userSaveRecordOfGoogleOrFacebook(userCredential);

      /// show successfull message
      LoggerHelper.successSnakebar(title: "Congrate");
      Get.to(() => NavigateMenu());
    } catch (e) {
      FullScreenLoader.stopLoading();

      /// catch and show the generic error to users
      LoggerHelper.errorSnakebar(
          title: "Oh Snap!!!!!!!!!!!!", message: e.toString());
      log(e.toString());
    }
  }
}
