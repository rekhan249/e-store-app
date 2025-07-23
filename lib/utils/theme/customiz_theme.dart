import 'package:e_store_app/utils/theme/customize_theme_items/appbar_theme.dart';
import 'package:e_store_app/utils/theme/customize_theme_items/bottom_sheet_theme.dart';
import 'package:e_store_app/utils/theme/customize_theme_items/checkbox_theme.dart';
import 'package:e_store_app/utils/theme/customize_theme_items/chip_theme.dart';
import 'package:e_store_app/utils/theme/customize_theme_items/elevated_btn_theme.dart';
import 'package:e_store_app/utils/theme/customize_theme_items/outline_btn_theme.dart';
import 'package:e_store_app/utils/theme/customize_theme_items/text_theme.dart';
import 'package:e_store_app/utils/theme/customize_theme_items/textform_field_theme.dart';
import 'package:flutter/material.dart';

class CustomizTheme {
  CustomizTheme._();

  /// Theme data for app of light mode
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: CustomizeTextTheme.lightTextTheme,
      chipTheme: ChipsTheme.lightChipTheme,
      appBarTheme: AppsbarTheme.lightAppBarTheme,
      checkboxTheme: CheckboxsTheme.lightCheckboxTheme,
      bottomSheetTheme: BottomSheetsTheme.lightBottomSheetTheme,
      elevatedButtonTheme: ElevatedBtnTheme.lightElevatedBtnTheme,
      inputDecorationTheme: TextformFieldTheme.lightInputDecorationTheme,
      outlinedButtonTheme: OutlineBtnTheme.lightOutlineBtnTheme);

  /// Theme data for app of dark mode
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: CustomizeTextTheme.darkTextTheme,
      chipTheme: ChipsTheme.darkChipTheme,
      appBarTheme: AppsbarTheme.darkAppBarTheme,
      checkboxTheme: CheckboxsTheme.darkCheckboxTheme,
      bottomSheetTheme: BottomSheetsTheme.dartBottomSheetTheme,
      elevatedButtonTheme: ElevatedBtnTheme.darkElevatedBtnTheme,
      inputDecorationTheme: TextformFieldTheme.darkInputDecorationTheme,
      outlinedButtonTheme: OutlineBtnTheme.darkOutlineBtnTheme);
}
