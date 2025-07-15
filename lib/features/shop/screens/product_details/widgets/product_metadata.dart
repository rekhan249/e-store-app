import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class ProductMetadata extends StatelessWidget {
  const ProductMetadata({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircularContainer(
              radius: SizesLW.sm,
              backgroundColor: EStoreColors.secondary.withValues(alpha: 0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: SizesLW.sm, vertical: SizesLW.xs),
              child: Text("25%",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: EStoreColors.black)),
            )
          ],
        )
      ],
    );
  }
}
