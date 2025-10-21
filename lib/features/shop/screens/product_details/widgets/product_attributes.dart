// ignore_for_file: collection_methods_unrelated_type

import 'package:e_store_app/common/widgets/chips/custom_choice.dart';
import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/products/cart/product_price_text.dart';
import 'package:e_store_app/common/widgets/texts/product_title.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/shop/controllers/variation_controller.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAttributes extends StatelessWidget {
  final ProductModel product;
  final bool isDark;
  const ProductAttributes(
      {super.key, required this.product, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final isDark = EHelperFunc.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            CircularContainer(
              padding: EdgeInsets.all(SizesLW.md),
              backgroundColor:
                  isDark ? EStoreColors.darkerGrey : EStoreColors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      SectionHeading(
                          title: "Variation", showActionButton: false),
                      SizedBox(width: SizesLW.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ProductTitle(title: "Price", smallSize: true),
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                    "\$${controller.selectedVariation.value.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough)),
                              SizedBox(width: SizesLW.spaceBtwItems),
                              ProductPriceText(
                                  price: controller.getVariationPrice())
                            ],
                          ),
                          Row(
                            children: [
                              ProductTitle(title: "Stock", smallSize: true),
                              SizedBox(width: SizesLW.spaceBtwItems),
                              Text(controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium!)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: SizesLW.spaceBtwItems / 2),
                  ProductTitle(
                      title:
                          controller.selectedVariation.value.description ?? "",
                      smallSize: true,
                      maxLines: 4),
                ],
              ),
            ),
          SizedBox(height: SizesLW.spaceBtwItems),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAtrributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeading(
                            title: attribute.name ?? "",
                            showActionButton: false),
                        SizedBox(height: SizesLW.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                              children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;
                            final available = controller
                                .getAttributeAvailabilityInVariation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValue);
                            return CustomChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (value) {
                                        if (value && available) {
                                          controller.anAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue);
                                        }
                                      }
                                    : null);
                          }).toList()),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
