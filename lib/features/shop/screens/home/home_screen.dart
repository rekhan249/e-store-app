import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/common/styles/shimmer_effect.dart';
import 'package:e_store_app/common/widgets/custom_shapes/containers/custom_search.dart';
import 'package:e_store_app/common/widgets/custom_shapes/curved_edges/clippath_custom_curved.dart';
import 'package:e_store_app/common/widgets/layouts/grid_layout_custom.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/product_card_vert.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/shop/controllers/product_controller.dart';
import 'package:e_store_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_store_app/features/shop/screens/home/widgets/custom_home_category/custom_home_cat.dart';
import 'package:e_store_app/features/shop/screens/home/widgets/home_custom_appbar.dart';
import 'package:e_store_app/features/shop/screens/home/widgets/prome_slider/custom_promo.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final dark = EHelperFunc.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeadCurvedClipPath(
                child: Column(
              children: [
                /// Appbar
                HomeCustomAppBar(),
                SizedBox(height: SizesLW.spacesBtwSections),

                /// SearchBar
                CustomSearching(text: "Search in store"),
                SizedBox(height: SizesLW.spacesBtwSections),

                /// Heading
                Padding(
                  padding: EdgeInsets.only(left: SizesLW.defaultSpaces),
                  child: Column(
                    children: [
                      SectionHeading(
                          title: "Popular Categories",
                          showActionButton: false,
                          onPressed: () {},
                          textColor: EStoreColors.white),
                      SizedBox(height: SizesLW.spaceBtwItems),

                      /// Categories
                      CustomHomeCategories(dark: dark),
                    ],
                  ),
                ),
                SizedBox(height: SizesLW.spacesBtwSections),
              ],
            )),

            /// Body of Home
            Padding(
              padding: const EdgeInsets.all(SizesLW.defaultSpaces),
              child: Column(
                children: [
                  PromoSlider(),
                  SizedBox(height: SizesLW.spacesBtwSections),

                  /// Heading
                  SectionHeading(
                    title: "Popular Products",
                    onPressed: () => Get.to(
                      () => AllProducts(
                        title: 'Popular Products',
                        query: FirebaseFirestore.instance
                            .collection("products")
                            .where("isFeatured", isEqualTo: true)
                            .limit(6),
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  SizedBox(height: SizesLW.spaceBtwItems),

                  /// --- Popular Products
                  Obx(
                    () {
                      if (controller.isLoading.value) return ShimmerEffect();
                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                            child: Text("Data not found",
                                style: Theme.of(context).textTheme.bodyMedium));
                      }
                      return GridLayoutCustom(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (context, index) => ProductCardVert(
                              product: controller.featuredProducts[index]));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
