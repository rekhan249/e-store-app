import 'package:e_store_app/common/widgets/image/circular_image.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomUserProTile extends StatelessWidget {
  final String title, subTitle, image;
  final VoidCallback onPressed;
  const CustomUserProTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: CircularImage(image: image, width: 50, height: 50),
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: EStoreColors.white)),
      subtitle: Text(subTitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: EStoreColors.white)),
      trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.edit, color: EStoreColors.white)),
    );
  }
}
