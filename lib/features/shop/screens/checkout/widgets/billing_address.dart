import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class BillingAddress extends StatelessWidget {
  const BillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
            title: "Shipping Address", buttonTitle: "Change", onPressed: () {}),
        Text("Coding With REk", style: Theme.of(context).textTheme.bodyLarge),
        Row(
          children: [
            Icon(Icons.phone, color: EStoreColors.grey, size: 16),
            SizedBox(width: SizesLW.spaceBtwItems),
            Text("+92-346-1234567",
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        SizedBox(width: SizesLW.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: EStoreColors.grey, size: 16),
            SizedBox(width: SizesLW.spaceBtwItems),
            Expanded(
              child: Text("House no.00,street no.00,sector # 00,Rawalpindi",
                  style: Theme.of(context).textTheme.bodyLarge, softWrap: true),
            ),
          ],
        ),
      ],
    );
  }
}
