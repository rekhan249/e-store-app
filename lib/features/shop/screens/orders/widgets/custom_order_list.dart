import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomOrderList extends StatelessWidget {
  const CustomOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return ListView.separated(
        itemBuilder: (context, index) => CircularContainer(
              showBorder: true,
              padding: EdgeInsets.all(SizesLW.md),
              backgroundColor: isDark ? EStoreColors.dark : EStoreColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      /// Row - 1
                      Expanded(
                        child: Row(
                          children: [
                            /// 1 - Icon
                            Icon(Iconsax.ship),
                            SizedBox(width: SizesLW.spaceBtwItems / 2),

                            /// 2 - Status & Date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Processing",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: EStoreColors.primary,
                                              fontSizeDelta: 1)),
                                  Text("21 Aug,2025",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Iconsax.arrow_right_34,
                                    size: SizesLW.iconSm)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizesLW.spaceBtwItems),

                  /// Row - 2
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            /// 1 - Icon
                            Icon(Iconsax.tag),
                            SizedBox(width: SizesLW.spaceBtwItems / 2),

                            /// 2 - Status & Date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Oder",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                                  Text("[#256f2]",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            /// 1 - Icon
                            Icon(Iconsax.calendar),
                            SizedBox(width: SizesLW.spaceBtwItems / 2),

                            /// 2 - Status & Date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Shipping Date",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                                  Text("21 Sept,2025",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        separatorBuilder: (context, index) =>
            SizedBox(height: SizesLW.spaceBtwItems),
        itemCount: 10);
  }
}
