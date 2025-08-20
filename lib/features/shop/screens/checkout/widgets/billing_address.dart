import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class BillingAddress extends StatelessWidget {
  const BillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(
            title: "Payment Method", buttonTitle: "Change", onPressed: () {}),
        SizedBox(height: SizesLW.spaceBtwItems / 2),
        Row(
          children: [
            CircularContainer(
              width: 60,
              height: 35,
              backgroundColor: isDark ? EStoreColors.dark : EStoreColors.white,
              padding: EdgeInsets.all(SizesLW.sm),
            ),
          ],
        )
      ],
    );
  }
}
