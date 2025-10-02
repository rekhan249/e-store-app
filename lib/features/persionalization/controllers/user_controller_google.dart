import 'package:e_store_app/data/repositories/user/user_repository.dart';
import 'package:e_store_app/models/signup_model.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserControllerGoogle extends GetxController {
  static UserControllerGoogle get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepo = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      final user = await userRepo.fetchUserRecord();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
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
}
