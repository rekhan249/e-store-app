import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/data/repositories/authentic_repository.dart';
import 'package:e_store_app/data/services/firebase_storage.dart';
import 'package:e_store_app/features/shop/models/category_model.dart';
import 'package:e_store_app/models/signup_model.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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

  /// upload any image
  Future<String> uploadToCloudinary(FilePickerResult? filePickerResult) async {
    try {
      if (filePickerResult == null || filePickerResult.files.isEmpty) {
        LoggerHelper.errorSnakebar(
            title: "Selection Error", message: "no image selected yet");
        return "";
      }
      XFile file = XFile(filePickerResult.files.single.path!);
      String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? "";

      /// create multipartrequest to upload a file
      var uri =
          Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/raw/upload");
      var request = http.MultipartRequest("POST", uri);

      /// file read as bytes
      var fileBytes = await file.readAsBytes();
      var multipartFile = http.MultipartFile.fromBytes('file', fileBytes,
          filename: file.path.split("/").last);

      /// Add file part to request
      request.files.add(multipartFile);
      request.fields['upload_preset'] = "e-store-preset-images";
      request.fields['resource_type'] = "raw";
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      log(responseBody);
      final json = jsonDecode(responseBody);
      String? imageUrl = json['secure_url'];
      if (response.statusCode == 200) {
        LoggerHelper.successSnakebar(
            title: "Successfull", message: "image is uploaded");
        log(" Successfull image is uploaded");
      } else {
        LoggerHelper.errorSnakebar(
            title: "Unsuccessfull",
            message: "no image uploaded yet${response.statusCode}");
      }
      return imageUrl!;
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

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      /// Upload all inage with their categories
      final storageCloudinary = Get.put(CustomCloudinaryStorageServices());

      /// loop through each categories
      for (var category in categories) {
        /// Get ImageData link from the local assets
        final file =
            await storageCloudinary.getImageDataFromAssets(category.image);

        /// upload Image and get its Url
        final url =
            await storageCloudinary.uploadToCloudinary(file, category.image);

        category.image = url;
        await _db
            .collection("categories")
            .doc(category.id)
            .set(category.toMap());
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
}
