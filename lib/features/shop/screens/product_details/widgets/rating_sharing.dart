import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomRatingAndShare extends StatelessWidget {
  const CustomRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Iconsax.star5, color: Colors.amber, size: 24),
            SizedBox(height: SizesLW.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(text: '(19)')
            ]))
          ],
        ),
        IconButton(
            onPressed: () {}, icon: Icon(Iconsax.share, size: SizesLW.md))
      ],
    );
  }
}
