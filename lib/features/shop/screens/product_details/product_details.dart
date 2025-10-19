import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_store_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_store_app/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:e_store_app/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:e_store_app/features/shop/screens/product_details/widgets/rating_sharing.dart';
import 'package:e_store_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_store_app/utils/contants/enums.dart';
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
          ProductImageSilder(product: product),

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
                ProductMetadata(product: product, isDark: isDark),

                SizedBox(height: SizesLW.spaceBtwItems),
                if (product.productType == ProductType.variable.toString())
                  ProductAttributes(product: product, isDark: isDark),
                if (product.productType == ProductType.variable.toString())
                  SizedBox(height: SizesLW.spacesBtwSections),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Checkout"))),
                SizedBox(height: SizesLW.spacesBtwSections),

                /// Description
                SectionHeading(title: "Description", showActionButton: false),
                SizedBox(height: SizesLW.spaceBtwItems),
                ReadMoreText(product.description ?? "",
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
