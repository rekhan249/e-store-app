import 'package:e_store_app/data/repositories/authentic_repository.dart';
import 'package:e_store_app/data/repositories/user/user_repository.dart';
import 'package:e_store_app/features/authentication/screens/login/login_screen.dart';
import 'package:e_store_app/features/persionalization/screens/profile/widgets/reauth_login_form.dart';
import 'package:e_store_app/models/signup_model.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/network_manage.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:e_store_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserControllerGoogle extends GetxController {
  static UserControllerGoogle get instance => Get.find();

  final profileLoader = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepo = Get.put(UserRepository());
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      profileLoader.value = true;
      final user = await userRepo.fetchUserRecord();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoader.value = false;
    }
  }

  /// save users data against any registered provider
  Future<void> userSaveRecordOfGoogleOrFacebook(
      UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        /// split name into two parts first and last
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUserName(userCredential.user!.displayName ?? '');
        final UserModel userModel = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNum: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '');
        await userRepo.saveUserRecord(userModel);
      }
    } catch (e) {
      LoggerHelper.warningSnakebar(
          title: "Data not save yet", message: "Something went wrong");
    }
  }

  /// Delete account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(SizesLW.md),
        title: "Delete Account",
        middleText: "Are you want to sure to delete yours account?",
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizesLW.lg),
              child: Text("Delete")),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: Text("Cancel")));
  }

  /// Delete user account
  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog("Processing", ImageStrings.animalIcon);

      /// First re-authenticate the user
      final auth = AuthenticRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == "password") {
          FullScreenLoader.stopLoading();
          Get.offAll(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      LoggerHelper.errorSnakebar(title: "Oh Snap");
    }
  }

  /// re-authenticate before deletion
  void reAuthenticateBeforeDeleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog("Processing", ImageStrings.animalIcon);
      final isConnected = await NetworkManage.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      /// form validation
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      await AuthenticRepository.instance.reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
    } catch (e) {
      FullScreenLoader.stopLoading();
      LoggerHelper.errorSnakebar(title: "Oh Snap");
    }
  }
}
