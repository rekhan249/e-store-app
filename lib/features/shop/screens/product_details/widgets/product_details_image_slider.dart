import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/custom_shapes/curved_edges/clippath_custom_curved.dart';
import 'package:e_store_app/common/widgets/icons/circular_icon.dart';
import 'package:e_store_app/common/widgets/image/image_round.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSilder extends StatelessWidget {
  final ProductModel product;
  const ProductImageSilder({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return CustomCurvedClipPath(
        child: Container(
      color: isDark ? EStoreColors.darkGrey : EStoreColors.light,
      child: Stack(
        children: [
          SizedBox(
            width: 400,
            child: Padding(
              padding: EdgeInsets.all(SizesLW.productImageRadius * 2),
              child: Center(
                child: Image(image: AssetImage(ImageStrings.prodImage10)),
              ),
            ),
          ),

          /// Image Slider
          Positioned(
            right: 0,
            bottom: 30,
            left: SizesLW.defaultSpaces,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ImageRoundHome(
                      width: 80,
                      padding: EdgeInsets.all(SizesLW.sm),
                      border: Border.all(color: EStoreColors.primary),
                      backgroundColor:
                          isDark ? EStoreColors.dark : EStoreColors.white,
                      imageUrl: ImageStrings.prodImage10),
                  separatorBuilder: (_, __) =>
                      SizedBox(width: SizesLW.spaceBtwItems),
                  itemCount: 8),
            ),
          ),

          /// Appbar Icons
          CustomAppbar(
            showBackArrow: true,
            actions: [
              CircularIcon(
                isDark: isDark,
                icon: Iconsax.heart5,
                color: Colors.red,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    ));
  }
}
