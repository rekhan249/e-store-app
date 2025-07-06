import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/device/device_utilities.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearching extends StatelessWidget {
  final String text;
  final IconData? iconSreach;
  final bool showBackground, showBoarder;
  final EdgeInsetsGeometry padding;
  const CustomSearching(
      {super.key,
      required this.text,
      this.iconSreach = Iconsax.search_normal,
      this.showBackground = true,
      this.showBoarder = true,
      this.padding =
          const EdgeInsets.symmetric(horizontal: SizesLW.defaultSpaces)});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunc.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: DeviceUtilities.getScreenWidth(context),
        padding: EdgeInsets.all(SizesLW.md),
        decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? EStoreColors.dark
                    : EStoreColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(SizesLW.cardRadiusLg),
            border: showBoarder ? Border.all(color: EStoreColors.grey) : null),
        child: Row(
          children: [
            Icon(iconSreach, color: EStoreColors.darkerGrey),
            SizedBox(width: SizesLW.spaceBtwItems),
            Text(text, style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
