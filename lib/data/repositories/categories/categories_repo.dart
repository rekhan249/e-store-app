import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/features/shop/models/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoriesRepo extends GetxController {
  static CategoriesRepo get instance => Get.find();

  ///  variable and database initializer
  final _db = FirebaseFirestore.instance;

  /// Get all categories

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapShot = await _db.collection("Categories").get();
      final list = snapShot.docs
          .map((document) => CategoryModel.fromMap(document))
          .toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code).message!;
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth').message!;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  /// Get all sub categories
  /// upload categories back to firebase
}
