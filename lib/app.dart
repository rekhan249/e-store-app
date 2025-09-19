import 'package:e_store_app/bindings/general_bindings.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/theme/customiz_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electronic Store',
      themeMode: ThemeMode.system,
      theme: CustomizTheme.lightTheme,
      darkTheme: CustomizTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: Scaffold(
        backgroundColor: EStoreColors.primary,
        body:
            Center(child: CircularProgressIndicator(color: EStoreColors.white)),
      ),
    );
  }
}
