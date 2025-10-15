import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/texts/product_title.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          showBackArrow: true,
          title: Text("Upload Data",
              style: Theme.of(context).textTheme.titleMedium)),
      body: Padding(
        padding: EdgeInsets.all(SizesLW.defaultSpaces),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductTitle(title: "Main Record"),
            SizedBox(height: SizesLW.spaceBtwItems),
            CustomListTileForUploadData(
                title: "Upload Categories",
                iconData: Iconsax.category,
                onTap: () {}),
            CustomListTileForUploadData(
                title: "Upload Brands", iconData: Iconsax.shop, onTap: () {}),
            CustomListTileForUploadData(
                title: "Upload Products",
                iconData: Iconsax.shopping_cart,
                onTap: () {}),
            CustomListTileForUploadData(
                title: "Upload Banners",
                iconData: Iconsax.slider,
                onTap: () {}),
            SizedBox(height: SizesLW.spacesBtwSections),
            ProductTitle(title: "Relationships"),
            SizedBox(height: SizesLW.spaceBtwItems),
            CustomListTileForUploadData(
                title: "Upload Brands & Categories Relation Data",
                iconData: Iconsax.link,
                onTap: () {}),
            CustomListTileForUploadData(
                title: "Upload Product Categories Relation Data",
                iconData: Iconsax.link,
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class CustomListTileForUploadData extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  const CustomListTileForUploadData(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizesLW.sm * 0.5),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.all(0),
        leading: Icon(iconData, color: EStoreColors.primary),
        title: Text(title, style: Theme.of(context).textTheme.titleSmall),
        trailing: Icon(Iconsax.arrow_circle_up, color: EStoreColors.primary),
      ),
    );
  }
}
