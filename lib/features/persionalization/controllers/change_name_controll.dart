import 'package:e_store_app/data/repositories/user/user_repository.dart';
import 'package:e_store_app/features/persionalization/controllers/user_controller_google.dart';
import 'package:e_store_app/features/persionalization/screens/profile/profile_screen.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/helpers/network_manage.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:e_store_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameControll extends GetxController {
  static ChangeNameControll get instance => Get.find();

  /// Controller of the text fields
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userControll = UserControllerGoogle.instance;
  final userRepo = Get.put(UserRepository());
  GlobalKey<FormState> changeNameFormKey = GlobalKey<FormState>();

  /// init method for already existing value the saves in fields
  @override
  void onInit() {
    super.onInit();
    initializedNames();
  }

  Future<void> initializedNames() async {
    firstName.text = userControll.user.value.firstName;
    lastName.text = userControll.user.value.lastName;
  }

  /// Update Users name
  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDialog(
          "We are updating yours info", ImageStrings.animalIcon);

      /// check internet connectivity
      final isConnected = await NetworkManage.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      /// form validation
      if (!changeNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      /// Updatation of first and last name in firebase
      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepo.updateAnyUserFieldRecord(name);

      /// Update rx user values
      userControll.user.value.firstName = firstName.text.trim();
      userControll.user.value.lastName = lastName.text.trim();
      FullScreenLoader.stopLoading();

      /// Success message
      LoggerHelper.successSnakebar(
          title: "Congrates", message: "Your name has been update");
      Get.offAll(() => ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
    }
  }
}
