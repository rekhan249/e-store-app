import 'package:e_store_app/utils/contants/colors.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  final double? height, width, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  const CircularIcon(
      {super.key,
      required this.isDark,
      this.height,
      this.width,
      this.size,
      required this.icon,
      this.color,
      this.backgroundColor,
      required this.onPressed});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: isDark
              ? EStoreColors.black.withValues(alpha: 0.1)
              : EStoreColors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            color: color,
            icon,
            size: size,
          )),
    );
  }
}
