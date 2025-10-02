import 'package:e_store_app/common/widgets/Appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/products/cart/custom_cart_counter.dart';
import 'package:e_store_app/features/persionalization/controllers/user_controller_google.dart';
import 'package:e_store_app/features/shop/screens/cart/cart_screen.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserControllerGoogle());
    return CustomAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(controller.user.value.firstName,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: EStoreColors.grey)),
          Text(controller.user.value.lastName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: EStoreColors.white)),
        ],
      ),
      actions: [
        CartCounterIcon(
            onPressed: () => Get.to(() => CartScreen()),
            iconColor: EStoreColors.white),
      ],
    );
  }
}
