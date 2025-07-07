import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/brand_card.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class BrandShowCase extends StatelessWidget {
  final List<String> images;
  const BrandShowCase({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      showBorder: true,
      borderColor: EStoreColors.darkGrey,
      padding: EdgeInsets.all(SizesLW.md),
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.only(bottom: SizesLW.spaceBtwItems),
      child: Column(children: [
        /// Brand with Products Count
        CustomBrandCard(showBoarder: false),

        /// Brand Top 3 Product Images
        Row(
          children: images
              .map((image) => brandTopproductImage(image, context))
              .toList(),
        )
      ]),
    );
  }

  Widget brandTopproductImage(String image, context) {
    return Expanded(
      child: CircularContainer(
          height: 100,
          backgroundColor: EHelperFunc.isDarkMode(context)
              ? EStoreColors.darkGrey
              : EStoreColors.light,
          margin: EdgeInsets.only(right: SizesLW.sm),
          padding: EdgeInsets.all(SizesLW.md),
          child: Image(fit: BoxFit.contain, image: AssetImage(image))),
    );
  }
}
