import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class CustomVerticalTextImage extends StatelessWidget {
  final String image, title;
  final Color? textColor, backgroundColor;
  final bool dark;
  final VoidCallback onTap;
  const CustomVerticalTextImage(
      {super.key,
      required this.image,
      required this.title,
      this.textColor = EStoreColors.white,
      this.backgroundColor,
      required this.onTap,
      required this.dark});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SizesLW.spaceBtwItems),
        child: Column(children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(SizesLW.sm),
            decoration: BoxDecoration(
                color: backgroundColor ??
                    (dark ? EStoreColors.black : EStoreColors.white),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: Image(
              image: AssetImage(ImageStrings.shoesIcon),
              fit: BoxFit.cover,
              color: dark ? EStoreColors.dark : EStoreColors.light,
            )),
          ),
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
