import 'package:e_store_app/utils/contants/colors.dart';
import 'package:flutter/material.dart';

class ShadowStyle {
  /// vertical Product Shadow
  static final verticalProductShadow = BoxShadow(
      color: EStoreColors.darkGrey.withValues(alpha: 0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0, 2));

  /// horizontal Product Shadow
  static final horizontalProductShadow = BoxShadow(
      color: EStoreColors.darkGrey.withValues(alpha: 0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0, 2));
}
