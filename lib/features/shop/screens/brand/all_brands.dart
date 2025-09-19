import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/layouts/grid_layout_custom.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/brand_card.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
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
              GridLayoutCustom(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => CustomBrandCard(
                      showBoarder: true,
                      onTap: () => Get.to(() => BrandProducts()))),
            ],
          ),
        ),
      ),
    );
  }
}
