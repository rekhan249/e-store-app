import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/device/device_utilities.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  const CustomTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Material(
      color: isDark ? EStoreColors.black : EStoreColors.white,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        tabs: tabs,
        isScrollable: true,
        indicatorColor: EStoreColors.primary,
        labelColor: isDark ? EStoreColors.white : EStoreColors.primary,
        unselectedLabelColor: EStoreColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtilities.getAppBarHeight());
}
