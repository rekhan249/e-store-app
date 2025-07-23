import 'package:e_store_app/common/widgets/Appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/icons/circular_icon.dart';
import 'package:e_store_app/common/widgets/products/cart/cart_item.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SizesLW.defaultSpaces),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                      children: [
                        CustomItemCart(),
                        SizedBox(height: SizesLW.spaceBtwItems),
                        Row(
                          children: [
                            CircularIcon(
                                isDark: isDark,
                                icon: Iconsax.minus,
                                onPressed: () {},
                                color: isDark
                                    ? EStoreColors.light
                                    : EStoreColors.black,
                                backgroundColor: isDark
                                    ? EStoreColors.darkerGrey
                                    : EStoreColors.light),
                            SizedBox(height: SizesLW.spaceBtwItems),
                            Text("data",
                                style: Theme.of(context).textTheme.titleSmall),
                            SizedBox(height: SizesLW.spaceBtwItems),
                            CircularIcon(
                                isDark: isDark,
                                icon: Iconsax.minus,
                                onPressed: () {},
                                color: isDark
                                    ? EStoreColors.light
                                    : EStoreColors.black,
                                backgroundColor: isDark
                                    ? EStoreColors.darkerGrey
                                    : EStoreColors.light),
                          ],
                        ),
                      ],
                    ),
                separatorBuilder: (context, index) =>
                    SizedBox(height: SizesLW.spacesBtwSections),
                itemCount: 4),
          ),
        ));
  }
}
