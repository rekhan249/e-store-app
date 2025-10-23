import 'dart:developer';

import 'package:e_store_app/common/widgets/layouts/grid_layout_custom.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/product_card_vert.dart';
import 'package:e_store_app/features/shop/controllers/all_products_controller.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomSortableProducts extends StatelessWidget {
  final List<ProductModel>? products;
  const CustomSortableProducts({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    log(controller.toString());
    return Column(
      children: [
        /// Dropdown Menu item
        DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (value) {}),
        SizedBox(height: SizesLW.spacesBtwSections),

        /// Products

        GridLayoutCustom(
            itemCount: 4,
            itemBuilder: (context, index) =>
                ProductCardVert(product: products![index]))
      ],
    );
  }
}
