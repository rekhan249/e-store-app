import 'package:e_store_app/data/repositories/user/user_repository.dart';
import 'package:e_store_app/models/signup_model.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserControllerGoogle extends GetxController {
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
        await UserRepository.instance.saveUserRecord(userModel);
      }
    } catch (e) {
      LoggerHelper.warningSnakebar(
          title: "Data not save yet", message: "Something went wrong");
    }
  }
}
