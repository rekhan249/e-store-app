import 'package:e_store_app/common/widgets/image/circular_image.dart';
import 'package:e_store_app/common/widgets/products/cart/product_price_text.dart';
import 'package:e_store_app/common/widgets/texts/brandtitle_verifyicon.dart';
import 'package:e_store_app/common/widgets/texts/product_title.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_store_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_store_app/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:e_store_app/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:e_store_app/features/shop/screens/product_details/widgets/rating_sharing.dart';
import 'package:e_store_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/enums.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          /// 1 - Product Image Slider
          ProductImageSilder(),

          /// 2 - Product details
          Padding(
            padding: EdgeInsets.only(
                left: SizesLW.defaultSpaces,
                right: SizesLW.defaultSpaces,
                bottom: SizesLW.defaultSpaces),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// - Rating and sharing
                CustomRatingAndShare(),

                /// Price, title, stock and brand
                Row(
                  children: [
                    ProductMetadata(),
                    SizedBox(width: SizesLW.spaceBtwItems),
                    Text("\$250",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(decoration: TextDecoration.lineThrough)),
                    SizedBox(width: SizesLW.spaceBtwItems),
                    ProductPriceText(price: "175", isLarge: true),
                  ],
                ),
                SizedBox(width: SizesLW.spaceBtwItems / 1.5),
                ProductTitle(title: "Face Cream with hydration"),
                SizedBox(width: SizesLW.spaceBtwItems / 1.5),

                ///  Stock Status
                Row(
                  children: [
                    ProductTitle(title: "Status"),
                    SizedBox(width: SizesLW.spaceBtwItems),
                    Text("In Stock",
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                SizedBox(width: SizesLW.spaceBtwItems / 1.5),
                Row(
                  children: [
                    CircularImage(
                        image: ImageStrings.cosmeticIcon,
                        width: 32,
                        height: 32,
                        overLayColor:
                            isDark ? EStoreColors.white : EStoreColors.black),
                    BrandtitleVerifyicon(
                        title: "Cream", brandTextSize: TextSizes.medium)
                  ],
                ),
                SizedBox(height: SizesLW.spaceBtwItems),
                ProductAttributes(),
                SizedBox(height: SizesLW.spacesBtwSections),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Checkout"))),
                SizedBox(height: SizesLW.spacesBtwSections),

                /// Description
                SectionHeading(title: "Description", showActionButton: false),
                SizedBox(height: SizesLW.spaceBtwItems),
                ReadMoreText(
                    "A product of intense hydration with natural ingredents of restoring skin balance  the face cream",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                Divider(),

                /// Reviews
                SizedBox(height: SizesLW.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionHeading(
                        title: "Reviews(19)", showActionButton: false),
                    IconButton(
                        onPressed: () => Get.to(() => ProductReviews()),
                        icon: Icon(Iconsax.arrow_right_3, size: 18))
                  ],
                ),
                SizedBox(height: SizesLW.spacesBtwSections),
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomAddToCart(),
    );
  }
}
