import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/data/repositories/authentic_repository.dart';
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

  /// fetch user details based on userId
  Future<UserModel> fetchUserRecord() async {
    try {
      final documentSnap = await _db
          .collection("users")
          .doc(AuthenticRepository.instance.authUser?.uid)
          .get();
      if (documentSnap.exists) {
        return UserModel.fromMap(documentSnap);
      } else {
        return UserModel.empty();
      }
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

  /// update user details based on userId
  Future<void> updateUserRecord(UserModel userModel) async {
    try {
      await _db.collection("users").doc(userModel.id).update(userModel.toMap());
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

  /// update any user field
  Future<void> updateAnyUserFieldRecord(Map<String, dynamic> map) async {
    try {
      await _db
          .collection("users")
          .doc(AuthenticRepository.instance.authUser?.uid)
          .update(map);
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

  /// remove any user
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("users").doc(userId).delete();
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
