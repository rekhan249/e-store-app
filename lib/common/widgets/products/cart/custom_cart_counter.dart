import 'package:e_store_app/utils/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Color iconColor;
  const CartCounterIcon(
      {super.key,
      required this.onPressed,
      this.iconColor = EStoreColors.black});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: EStoreColors.black,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text('3',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: EStoreColors.white, fontSizeFactor: 0.8)),
            ),
          ),
        ),
      ],
    );
  }
}
