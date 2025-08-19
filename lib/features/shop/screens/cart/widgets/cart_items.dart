import 'package:e_store_app/common/widgets/products/cart/addremove_btn.dart';
import 'package:e_store_app/common/widgets/products/cart/cart_item.dart';
import 'package:e_store_app/common/widgets/products/cart/product_price_text.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems(
      {super.key, required this.isDark, this.showAddRemoveButton = true});

  final bool isDark;
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => Column(
              children: [
                CustomItemCart(),
                if (showAddRemoveButton)
                  SizedBox(height: SizesLW.spaceBtwItems),
                if (showAddRemoveButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 70),
                          ProductQuatityWithAddAndRemove(isDark: isDark),
                        ],
                      ),
                      ProductPriceText(price: "256")
                    ],
                  ),
              ],
            ),
        separatorBuilder: (context, index) =>
            SizedBox(height: SizesLW.spacesBtwSections),
        itemCount: 2);
  }
}
