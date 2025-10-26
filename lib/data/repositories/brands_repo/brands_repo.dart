import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/features/shop/models/brand_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandsRepository extends GetxController {
  /// variables
  final _db = FirebaseFirestore.instance;

  /// Get All Brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection("brands").get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
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

  /// Get Brand for category
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      /// Query to get all documents where categoryId is matched
      QuerySnapshot brandCategoryQuery = await _db
          .collection("brandCategory")
          .where("categoryId", isEqualTo: categoryId)
          .get();

      /// Extract brandId from documents
      List<String> brandIds =
          brandCategoryQuery.docs.map((e) => e['brandId'] as String).toList();

      /// Query to get all documents where the brandId is in the list of brandIds
      final brandsQuery = await _db
          .collection("brands")
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      /// Extract brand name or other relevant data from documents
      List<BrandModel> brands =
          brandsQuery.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return brands;
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
}
