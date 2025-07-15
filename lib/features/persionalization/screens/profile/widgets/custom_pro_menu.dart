import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomProfileMenu extends StatelessWidget {
  final String title, value;
  final VoidCallback onPressed;
  final IconData iconData;
  const CustomProfileMenu(
      {super.key,
      required this.title,
      required this.value,
      required this.onPressed,
      this.iconData = Iconsax.arrow_right_34});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: SizesLW.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(title,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Expanded(
                flex: 5,
                child: Text(value,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis)),
            Expanded(child: Icon(Iconsax.arrow_right_34, size: 18)),
          ],
        ),
      ),
    );
  }
}
