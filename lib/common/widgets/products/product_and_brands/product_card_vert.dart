import 'package:e_store_app/common/styles/shadow_style.dart';
import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/icons/circular_icon.dart';
import 'package:e_store_app/common/widgets/image/image_round.dart';
import 'package:e_store_app/common/widgets/products/cart/product_price_text.dart';
import 'package:e_store_app/common/widgets/texts/brandtitle_verifyicon.dart';
import 'package:e_store_app/common/widgets/texts/product_title.dart';
import 'package:e_store_app/features/shop/screens/product_details/product_details.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVert extends StatelessWidget {
  const ProductCardVert({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails()),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(SizesLW.productImageRadius),
            color: isDark ? EStoreColors.darkerGrey : EStoreColors.white),
        child: Column(
          children: [
            /// --- Thumbnail , Wishlist, discount tag
            CircularContainer(
              height: 180,
              padding: EdgeInsets.all(SizesLW.sm),
              backgroundColor: isDark ? EStoreColors.dark : EStoreColors.light,
              child: Stack(
                children: [
                  ImageRoundHome(
                      imageUrl: ImageStrings.prodImage1,
                      applyImageRadius: true),

                  /// -- Sale Tag
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
            SizedBox(height: SizesLW.spaceBtwItems / 2),

            /// --- Details
            Padding(
                padding: EdgeInsets.only(left: SizesLW.sm),
                child: Column(children: [
                  ProductTitle(title: 'Blue By-Cycle', smallSize: true),
                  SizedBox(height: SizesLW.spaceBtwItems / 2),
                  BrandtitleVerifyicon(title: "Sorab"),
                  SizedBox(height: SizesLW.spacesBtwSections - 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price Tag
                      ProductPriceText(
                        price: '35.5',
                      ),
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
                              child:
                                  Icon(Iconsax.add, color: EStoreColors.white)),
                        ),
                      )
                    ],
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
