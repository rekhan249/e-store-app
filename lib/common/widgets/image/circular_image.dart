import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store_app/common/styles/shimmer_effect.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final double width, height, padding;
  final Color? overLayColor, backgroundColor;
  final String image;
  final BoxFit? fit;
  final bool isNetworkImage;
  const CircularImage(
      {super.key,
      this.width = 56,
      this.height = 56,
      this.padding = SizesLW.sm,
      this.overLayColor,
      this.backgroundColor,
      required this.image,
      this.fit = BoxFit.cover,
      this.isNetworkImage = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ??
              (EHelperFunc.isDarkMode(context)
                  ? EStoreColors.black
                  : EStoreColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overLayColor,
                  imageUrl: image,
                  scale: 1,
                  progressIndicatorBuilder: (context, url, progress) =>
                      ShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => Icon(Icons.error))
              : Image(fit: fit, image: AssetImage(image), color: overLayColor),
        ),
      ),
    );
  }
}
