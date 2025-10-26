import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/data/services/firebase_storage.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/contants/enums.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepo extends GetxController {
  static ProductRepo get instance => Get.find();

  /// Firebase instance for database communitcations
  final _db = FirebaseFirestore.instance;

  /// Get limit featured Products
  Future<List<ProductModel>> getFeatureProducts() async {
    try {
      final snapShot = await _db
          .collection("products")
          .where("isFeatured", isEqualTo: true)
          .limit(4)
          .get();

      return snapShot.docs.map((e) => ProductModel.fromMap(e)).toList();
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

  /// Get all featured Products
  Future<List<ProductModel>> getAllFeatureProducts() async {
    try {
      final snapShot = await _db
          .collection("products")
          .where("isFeatured", isEqualTo: true)
          .get();

      return snapShot.docs.map((e) => ProductModel.fromMap(e)).toList();
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

  /// getAllProducts by Query
  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromQuerySnapShot(e))
          .toList();
      return productList;
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

  /// getAllProducts by Query
  Future<List<ProductModel>> getProductForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection("products")
              .where("brandId", isEqualTo: brandId)
              .get()
          : await _db
              .collection("products")
              .where("brandId", isEqualTo: brandId)
              .limit(limit)
              .get();
      final products = querySnapshot.docs
          .map((e) => ProductModel.fromQuerySnapShot(e))
          .toList();
      return products;
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

  /// Upload dummy data to the cloud Firebase
  Future<void> uploadDummmyProductsData(List<ProductModel> products) async {
    try {
      /// Upload all the project with along image
      final storage = Get.put(CustomCloudinaryStorageServices());

      /// loop through each product
      for (var product in products) {
        /// Get image data link from local assets
        final thumbNail =
            await storage.getImageDataFromAssets(product.thumbnail);

        /// upload image and get url
        final url = await storage.uploadToCloudinary(
            thumbNail, product.thumbnail.toString());

        /// assign url to product thumbnail attribute
        product.thumbnail = url;

        /// Product list of image
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            /// get image link from local assets
            final assetsImage = await storage.getImageDataFromAssets(image);

            /// Upload image and get its url
            final url = await storage.uploadToCloudinary(assetsImage, image);

            /// assign url to product thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        /// Upload variations images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            /// Get image data link from local assets
            final variationImage =
                await storage.getImageDataFromAssets(variation.image);

            /// Upload image and get its url
            final url = await storage.uploadToCloudinary(
                variationImage, variation.image);

            /// assign url to product variation attribute
            variation.image = url;
          }
        }
        await _db.collection("products").doc(product.id).set(product.toMap());
      }
    } catch (e) {
      LoggerHelper.errorSnakebar(title: "Oh Snap");
    }
  }
}
