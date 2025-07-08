import 'package:e_store_app/features/persionalization/screens/settings/setting_screen.dart';
import 'package:e_store_app/features/shop/screens/home/home_screen.dart';
import 'package:e_store_app/features/shop/screens/store/store_screen.dart';
import 'package:e_store_app/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigateMenu extends StatelessWidget {
  const NavigateMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationBarController());
    final darkMode = EHelperFunc.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: navController.selectedIndex.value,
            onDestinationSelected: (index) =>
                navController.selectedIndex.value = index,
            backgroundColor: darkMode ? EStoreColors.black : EStoreColors.white,
            indicatorColor: darkMode
                ? EStoreColors.white.withValues(alpha: 0.1)
                : EStoreColors.black.withValues(alpha: 0.1),
            destinations: [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: "WishList"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ]),
      ),
      body: Obx(() => navController.screens[navController.selectedIndex.value]),
    );
  }
}

/// Controller for the navigation bar
class NavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    StoreScreen(),
    WishlistScreen(),
    SettingScreen(),
  ];
}
