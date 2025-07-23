import 'package:e_store_app/common/widgets/chips/custom_choice.dart';
import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/products/cart/product_price_text.dart';
import 'package:e_store_app/common/widgets/texts/product_title.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Column(
      children: [
        CircularContainer(
          padding: EdgeInsets.all(SizesLW.md),
          backgroundColor: isDark ? EStoreColors.darkerGrey : EStoreColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  SectionHeading(title: "Variation", showActionButton: false),
                  SizedBox(width: SizesLW.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ProductTitle(title: "Price", smallSize: true),
                          SizedBox(width: SizesLW.spaceBtwItems),
                          Text("\$25",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          SizedBox(width: SizesLW.spaceBtwItems),
                          ProductPriceText(price: "20")
                        ],
                      ),
                      Row(
                        children: [
                          ProductTitle(title: "Stock", smallSize: true),
                          SizedBox(width: SizesLW.spaceBtwItems),
                          Text("In Stock",
                              style: Theme.of(context).textTheme.titleMedium!)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: SizesLW.spaceBtwItems / 2),
              ProductTitle(
                  title:
                      "Face Cream with restoring skin balance by intense hyderation using natural ingredients",
                  smallSize: true,
                  maxLines: 4),
            ],
          ),
        ),
        SizedBox(height: SizesLW.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: "Colors"),
            SizedBox(height: SizesLW.spaceBtwItems / 2),
            Wrap(
              children: [
                CustomChoiceChip(
                    text: 'Green', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {})
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: "Size"),
            SizedBox(height: SizesLW.spaceBtwItems / 2),
            Wrap(
              spacing: 10,
              children: [
                CustomChoiceChip(
                    text: 'EU 34', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'EU 36', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'EU 38', selected: false, onSelected: (value) {})
              ],
            ),
          ],
        )
      ],
    );
  }
}
