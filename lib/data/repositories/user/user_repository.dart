import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/models/signup_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data
  Future<void> saveUserRecord(UserModel userModel) async {
    try {
      await _db.collection("users").doc(userModel.id).set(userModel.toMap());
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'signup').message!;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
