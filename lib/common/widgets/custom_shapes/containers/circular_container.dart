import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final double? width, height;
  final double radius;
  final EdgeInsetsGeometry? margin, padding;
  final Color backgroundColor, borderColor;
  final bool showBorder;
  final Widget? child;
  const CircularContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = SizesLW.cardRadiusLg,
      this.padding,
      this.backgroundColor = EStoreColors.white,
      this.child,
      this.margin,
      this.showBorder = false,
      this.borderColor = EStoreColors.borderPrimary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
