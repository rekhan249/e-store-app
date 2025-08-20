import 'package:e_store_app/common/widgets/Appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/products/cart/custom_coupon.dart';
import 'package:e_store_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_store_app/features/shop/screens/checkout/widgets/billing_address.dart';
import 'package:e_store_app/features/shop/screens/checkout/widgets/billing_payment.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppbar(
          showBackArrow: true,
          title: Text("Checkout Order Review",
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(SizesLW.defaultSpaces),
        child: Column(
          children: [
            CartItems(isDark: isDark, showAddRemoveButton: false),
            SizedBox(height: SizesLW.spacesBtwSections),
            CustomCouponCode(isDark: isDark),
            SizedBox(height: SizesLW.spacesBtwSections),
            CircularContainer(
              showBorder: true,
              padding: EdgeInsets.all(SizesLW.md),
              backgroundColor: isDark ? EStoreColors.black : EStoreColors.white,
              child: Column(
                children: [
                  /// Pricing
                  BillingPayment(),
                  SizedBox(height: SizesLW.spaceBtwItems),

                  /// Divider
                  Divider(),
                  SizedBox(height: SizesLW.spaceBtwItems),

                  /// Payment Method
                  SizedBox(height: SizesLW.spaceBtwItems),
                  BillingAddress()

                  /// Address
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
