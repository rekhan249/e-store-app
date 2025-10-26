import 'package:e_store_app/common/styles/shimmer_effect.dart';
import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/layouts/grid_layout_custom.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/brand_card.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/shop/controllers/brand_controller.dart';
import 'package:e_store_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final brandControll = Get.put(BrandController());
    return Scaffold(
      appBar: CustomAppbar(title: Text("Brand"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesLW.defaultSpaces),
          child: Column(
            children: [
              /// heading
              SectionHeading(title: "Brands"),
              SizedBox(height: SizesLW.spaceBtwItems),

              /// -- Brands
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
                      onTap: () => Get.to(() => BrandProducts(brand: brand)),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
