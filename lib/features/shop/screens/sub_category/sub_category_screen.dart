import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/image/image_round.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/product_card_hori.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text("Sports"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesLW.defaultSpaces),
          child: Column(
            children: [
              /// Banners
              ImageRoundHome(
                  imageUrl: ImageStrings.promoBan1,
                  applyImageRadius: true,
                  width: double.infinity),
              SizedBox(height: SizesLW.spacesBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  SectionHeading(title: "Sports Shirts", onPressed: () {}),
                  SizedBox(height: SizesLW.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ProductCardHori(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: SizesLW.spaceBtwItems),
                        itemCount: 4),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
