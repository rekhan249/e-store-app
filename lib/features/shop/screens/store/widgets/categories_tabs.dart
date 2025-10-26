import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/shop/models/category_model.dart';
import 'package:e_store_app/features/shop/screens/store/widgets/category_brand.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class CategoriesTabs extends StatelessWidget {
  final CategoryModel category;
  const CategoriesTabs({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
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
              SectionHeading(title: "You might like", onPressed: () {}),
              SizedBox(height: SizesLW.spaceBtwItems),
              // GridLayoutCustom(
              //     itemCount: 4,
              //     itemBuilder: (context, index) => ProductCardVert()),
              SizedBox(height: SizesLW.spacesBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
