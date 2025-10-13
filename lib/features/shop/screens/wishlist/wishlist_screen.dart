import 'package:e_store_app/common/widgets/Appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/icons/circular_icon.dart';
import 'package:e_store_app/features/shop/screens/home/home_screen.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppbar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CircularIcon(
            isDark: isDark,
            icon: Iconsax.add,
            onPressed: () => Get.to(() => HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(SizesLW.defaultSpaces),
        child: Column(
          children: [
            // GridLayoutCustom(
            //     itemCount: 6,
            //     itemBuilder: (context, index) => ProductCardVert())
          ],
        ),
      )),
    );
  }
}
