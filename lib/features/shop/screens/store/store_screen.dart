import 'package:e_store_app/common/styles/shimmer_effect.dart';
import 'package:e_store_app/common/widgets/appbar/custom_tabbar.dart';
import 'package:e_store_app/common/widgets/custom_shapes/containers/custom_search.dart';
import 'package:e_store_app/common/widgets/layouts/grid_layout_custom.dart';
import 'package:e_store_app/common/widgets/products/cart/custom_cart_counter.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/brand_card.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/shop/controllers/brand_controller.dart';
import 'package:e_store_app/features/shop/controllers/categories_controller.dart';
import 'package:e_store_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_store_app/features/shop/screens/store/widgets/categories_tabs.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandControll = Get.put(BrandController());
    final categories = CategoriesController.instance.featuresCategoris;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title:
              Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CartCounterIcon(
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: EHelperFunc.isDarkMode(context)
                      ? EStoreColors.black
                      : EStoreColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.all(SizesLW.defaultSpaces),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        SizedBox(height: SizesLW.spaceBtwItems),

                        /// --- search bar
                        CustomSearching(
                            text: "Search in Store",
                            showBoarder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero),

                        SizedBox(height: SizesLW.spacesBtwSections),

                        /// --- Featured Brands
                        SectionHeading(title: "Featured Brands"),
                        SizedBox(height: SizesLW.spaceBtwItems / 2),
                        Obx(() {
                          if (brandControll.isLoading.value) {
                            return ShimmerEffect();
                          }
                          if (brandControll.featuredBrands.isEmpty) {
                            return Center(
                                child: Text("Data not found",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(color: EStoreColors.white)));
                          }
                          return GridLayoutCustom(
                            itemCount: brandControll.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (context, index) {
                              final brand = brandControll.featuredBrands[index];
                              return CustomBrandCard(
                                showBoarder: true,
                                brand: brand,
                                onTap: () =>
                                    Get.to(() => BrandProducts(brand: brand)),
                              );
                            },
                          );
                        })
                      ],
                    ),
                  ),
                  bottom: CustomTabBar(
                      tabs: categories
                          .map((category) => Tab(child: Text(category.name)))
                          .toList()),
                ),
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => CategoriesTabs(category: category))
                    .toList())),
      ),
    );
  }
}
