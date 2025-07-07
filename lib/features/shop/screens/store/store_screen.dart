import 'package:e_store_app/common/widgets/appbar/custom_tabbar.dart';
import 'package:e_store_app/common/widgets/custom_shapes/containers/custom_search.dart';
import 'package:e_store_app/common/widgets/layouts/grid_layout_custom.dart';
import 'package:e_store_app/common/widgets/products/cart/custom_cart_counter.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/brand_card.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/shop/screens/store/widgets/categories_tabs.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                        GridLayoutCustom(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (context, index) {
                            return CustomBrandCard(showBoarder: true);
                          },
                        )
                      ],
                    ),
                  ),
                  bottom: CustomTabBar(tabs: [
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("Clothes")),
                    Tab(child: Text("Cosmetics")),
                  ]),
                ),
              ];
            },
            body: TabBarView(children: [
              CategoriesTabs(),
              CategoriesTabs(),
              CategoriesTabs(),
              CategoriesTabs(),
              CategoriesTabs(),
            ])),
      ),
    );
  }
}
