import 'package:e_store_app/common/widgets/icons/circular_icon.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductQuatityWithAddAndRemove extends StatelessWidget {
  const ProductQuatityWithAddAndRemove({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
            isDark: isDark,
            icon: Iconsax.minus,
            onPressed: () {},
            color: isDark ? EStoreColors.light : EStoreColors.black,
            backgroundColor:
                isDark ? EStoreColors.darkerGrey : EStoreColors.light),
        SizedBox(height: SizesLW.spaceBtwItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: SizesLW.spaceBtwItems),
        CircularIcon(
            isDark: isDark,
            icon: Iconsax.add,
            onPressed: () {},
            color: isDark ? EStoreColors.light : EStoreColors.black,
            backgroundColor:
                isDark ? EStoreColors.darkerGrey : EStoreColors.light),
      ],
    );
  }
}
