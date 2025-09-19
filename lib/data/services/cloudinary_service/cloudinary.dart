import 'dart:developer';
import 'dart:io';

import 'package:e_store_app/utils/logging/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

Future<bool> uploadToCloudinary(FilePickerResult? filePickerResult) async {
  if (filePickerResult == null || filePickerResult.files.isEmpty) {
    LoggerHelper.errorSnakebar(
        title: "Selection Error", message: "no image selected yet");
    return false;
  }
  File file = File(filePickerResult.files.single.path!);
  String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? "";

  /// create multipartrequest to upload a file
  var uri = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/raw/upload");
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
  if (response.statusCode == 200) {
    LoggerHelper.successSnakebar(
        title: "Successfull", message: "image is uploaded");
    log(" Successfull image is uploaded");
  } else {
    LoggerHelper.errorSnakebar(
        title: "Unsuccessfull",
        message: "no image uploaded yet${response.statusCode}");
  }
  return false;
}
