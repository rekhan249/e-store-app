import 'package:e_store_app/common/styles/shimmer_effect.dart';
import 'package:e_store_app/common/widgets/layouts/grid_layout_custom.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/product_card_vert.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/shop/controllers/categories_controller.dart';
import 'package:e_store_app/features/shop/models/category_model.dart';
import 'package:e_store_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_store_app/features/shop/screens/store/widgets/category_brand.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/cloud_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesTabs extends StatelessWidget {
  final CategoryModel category;
  const CategoriesTabs({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final categoryControll = CategoriesController.instance;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(SizesLW.defaultSpaces),
          child: Column(
            children: [
              /// Brands Showcase
              CategoryBrand(category: category),
              SizedBox(height: SizesLW.spaceBtwItems),

              /// --- Products that might you liked
              FutureBuilder(
                  future: categoryControll.getCategoryProducts(
                      categoryId: category.id),
                  builder: (context, snapshot) {
                    final response = CloudHelper.checkingMultipleRecordState(
                        snapshot: snapshot, loader: ShimmerEffect());
                    if (response != null) return response;

                    /// Record Found
                    final products = snapshot.data;
                    return Column(
                      children: [
                        SectionHeading(
                            title: "You might like",
                            onPressed: () => Get.to(() => AllProducts(
                                  title: category.name,
                                  futureMethod:
                                      categoryControll.getCategoryProducts(
                                          categoryId: category.id, limit: -1),
                                ))),
                        SizedBox(height: SizesLW.spaceBtwItems),
                        GridLayoutCustom(
                            itemCount: products!.length,
                            itemBuilder: (context, index) =>
                                ProductCardVert(product: products[index])),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
