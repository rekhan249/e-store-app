import 'package:e_store_app/features/authentication/screens/onboarding.dart';
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
      home: OnboardingScreen(),
    );
  }
}
