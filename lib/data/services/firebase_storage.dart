import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CustomCloudinaryStorageServices extends GetxController {
  static CustomCloudinaryStorageServices get instance => Get.find();

// Load image data from assets (similar to getImageDataFromAssets)
  Future<Uint8List> getImageDataFromAssets(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    return byteData.buffer.asUint8List();
  }

  // Upload image data (bytes) to Cloudinary
  Future<String> uploadToCloudinary(Uint8List? imageBytes) async {
    try {
      if (imageBytes == null || imageBytes.isEmpty) {
        LoggerHelper.errorSnakebar(
            title: "Selection Error", message: "no image selected yet");
        return "";
      }

      // Write bytes to a temporary file
      final tempDir = await getTemporaryDirectory();
      final filename =
          'temp_image_${DateTime.now().millisecondsSinceEpoch}.jpg'; // or any extension
      final tempPath = '${tempDir.path}/$filename';
      final files = File(tempPath);
      await files.writeAsBytes(imageBytes);

      // Now create XFile from the temporary file path
      XFile file = XFile(tempPath);
      String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? "";

      /// create multipartrequest to upload a file
      var uri =
          Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/raw/upload");
      var request = http.MultipartRequest("POST", uri);

      /// create MultipartFile from the file path
      var multipartFile = await http.MultipartFile.fromPath('file', file.path);

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
}
