import 'package:e_store_app/app.dart';
import 'package:e_store_app/data/repositories/authentic_repository.dart';
import 'package:e_store_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  /// Binding widgets
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// GetStorage initialization
  await GetStorage.init();

  /// Native Splash binding
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Firebase initializer
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticRepository()));
  // the main function
  runApp(const MyApp());
}
