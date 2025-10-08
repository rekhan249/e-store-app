import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double? width, height, radius;
  final Color? color;
  const ShimmerEffect(
      {super.key, this.width, this.height, this.radius = 15, this.color});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ??
                (isDark ? EStoreColors.darkerGrey : EStoreColors.white),
            borderRadius: BorderRadius.circular(radius!)),
      ),
    );
  }
}
