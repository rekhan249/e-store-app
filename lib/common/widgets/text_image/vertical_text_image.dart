import 'package:e_store_app/common/widgets/image/circular_image.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class CustomVerticalTextImage extends StatelessWidget {
  final String image, title;
  final Color? textColor, backgroundColor;
  final bool dark;
  final VoidCallback onTap;
  final bool isNetworkImage;
  const CustomVerticalTextImage(
      {super.key,
      required this.image,
      required this.title,
      this.textColor = EStoreColors.white,
      this.backgroundColor,
      required this.onTap,
      required this.dark,
      this.isNetworkImage = true});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: SizesLW.spaceBtwItems),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          CircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: SizesLW.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overLayColor: isDark ? EStoreColors.light : EStoreColors.dark),
          SizedBox(height: SizesLW.spaceBtwItems / 2),
          SizedBox(
            width: 55,
            child: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: EStoreColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          )
        ]),
      ),
    );
  }
}
