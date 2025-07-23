import 'package:e_store_app/common/widgets/image/circular_image.dart';
import 'package:e_store_app/common/widgets/texts/brandtitle_verifyicon.dart';
import 'package:e_store_app/common/widgets/texts/product_title.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularImage(
            image: ImageStrings.prodImage1,
            width: 60,
            height: 60,
            backgroundColor: EHelperFunc.isDarkMode(context)
                ? EStoreColors.darkerGrey
                : EStoreColors.light),
        SizedBox(width: SizesLW.spaceBtwItems),

        /// Title, Price and size
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BrandtitleVerifyicon(title: "Sorab"),
            Flexible(child: ProductTitle(title: "The colorful bicycle")),

            /// Attribute
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Color", style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: "Green", style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: "Size", style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: "UK 08", style: Theme.of(context).textTheme.bodyLarge),
            ]))
          ],
        )),
      ],
    );
  }
}
