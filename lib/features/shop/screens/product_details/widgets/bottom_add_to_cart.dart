import 'package:e_store_app/common/widgets/icons/circular_icon.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizesLW.defaultSpaces,
          vertical: SizesLW.defaultSpaces / 2),
      decoration: BoxDecoration(
        color: isDark ? EStoreColors.darkerGrey : EStoreColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizesLW.cardRadiusLg),
          topRight: Radius.circular(SizesLW.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CircularIcon(
              isDark: isDark,
              backgroundColor: EStoreColors.darkGrey,
              width: 40,
              height: 40,
              color: EStoreColors.white,
              icon: Iconsax.minus,
              onPressed: () {},
            ),
            SizedBox(width: SizesLW.spaceBtwItems),
            Text("2", style: Theme.of(context).textTheme.titleSmall),
            SizedBox(width: SizesLW.spaceBtwItems),
            CircularIcon(
              isDark: isDark,
              backgroundColor: EStoreColors.black,
              width: 40,
              height: 40,
              color: EStoreColors.white,
              icon: Iconsax.add,
              onPressed: () {},
            ),
          ]),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(SizesLW.md),
                  backgroundColor: EStoreColors.black,
                  side: BorderSide(color: EStoreColors.black)),
              child: Text("Add to Cart"))
        ],
      ),
    );
  }
}
