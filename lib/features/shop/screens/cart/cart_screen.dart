import 'package:e_store_app/common/widgets/Appbar/custom_appbar.dart';
import 'package:e_store_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_store_app/features/shop/screens/checkout/checkout.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppbar(
          showBackArrow: true,
          title:
              Text("Cart", style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: EdgeInsets.all(SizesLW.defaultSpaces),
        child: CartItems(isDark: isDark),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SizesLW.defaultSpaces),
        child: ElevatedButton(
            onPressed: () => Get.to(() => CheckoutScreen()),
            child: Text("CheckOut \$256.0")),
      ),
    );
  }
}
