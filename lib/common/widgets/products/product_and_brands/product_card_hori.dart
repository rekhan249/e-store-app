import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/icons/circular_icon.dart';
import 'package:e_store_app/common/widgets/image/image_round.dart';
import 'package:e_store_app/common/widgets/products/cart/product_price_text.dart';
import 'package:e_store_app/common/widgets/texts/brandtitle_verifyicon.dart';
import 'package:e_store_app/common/widgets/texts/product_title.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHori extends StatelessWidget {
  const ProductCardHori({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizesLW.productImageRadius),
          color:
              isDark ? EStoreColors.darkerGrey : EStoreColors.lightContainer),
      child: Row(
        children: [
          /// Thumbnail
          CircularContainer(
            height: 120,
            padding: EdgeInsets.all(SizesLW.sm),
            backgroundColor: isDark ? EStoreColors.dark : EStoreColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: ImageRoundHome(
                      imageUrl: ImageStrings.prodImage1,
                      applyImageRadius: true),
                ),

                /// Sale - Tag
                Positioned(
                  top: 12,
                  child: CircularContainer(
                    radius: SizesLW.sm,
                    backgroundColor:
                        EStoreColors.secondary.withValues(alpha: 0.8),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizesLW.sm, vertical: SizesLW.xs),
                    child: Text("25%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: EStoreColors.black)),
                  ),
                ),

                /// -- WishList/Heart Icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircularIcon(
                      isDark: isDark,
                      icon: Iconsax.heart5,
                      color: Colors.red,
                      onPressed: () {}),
                )
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: SizesLW.sm, left: SizesLW.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitle(
                          title: "Bicycle with blue white background",
                          smallSize: true),
                      SizedBox(height: SizesLW.spaceBtwItems / 2),
                      BrandtitleVerifyicon(title: "Sorab")
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: ProductPriceText(price: "256.0")),

                      /// Add to cart
                      Container(
                        decoration: BoxDecoration(
                          color: EStoreColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(SizesLW.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(SizesLW.productImageRadius)),
                        ),
                        child: SizedBox(
                          width: SizesLW.iconLg,
                          height: SizesLW.iconLg,
                          child: Center(
                            child: Icon(Iconsax.add, color: EStoreColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
