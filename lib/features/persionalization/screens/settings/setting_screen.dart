import 'package:e_store_app/admin_panel/upload_data/upload_data_screen.dart';
import 'package:e_store_app/common/widgets/Appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/custom_shapes/curved_edges/clippath_custom_curved.dart';
import 'package:e_store_app/common/widgets/list_tiles/custom_menu_tile.dart';
import 'package:e_store_app/common/widgets/list_tiles/custom_user_pro.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/persionalization/controllers/user_controller_google.dart';
import 'package:e_store_app/features/persionalization/screens/address/addresses.dart';
import 'package:e_store_app/features/persionalization/screens/profile/profile_screen.dart';
import 'package:e_store_app/features/shop/screens/orders/order_screen.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserControllerGoogle.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeadCurvedClipPath(
                child: Column(
              children: [
                CustomAppbar(
                    title: Text("Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: EStoreColors.white))),
                SizedBox(height: SizesLW.spacesBtwSections),

                /// User Profile card
                CustomUserProTile(
                  image: ImageStrings.rek,
                  title: controller.user.value.fullName,
                  subTitle: controller.user.value.email,
                  onPressed: () => Get.to(() => ProfileScreen()),
                ),
                SizedBox(height: SizesLW.spacesBtwSections),
              ],
            )),

            /// body
            Padding(
              padding: EdgeInsets.all(SizesLW.defaultSpaces),
              child: Column(children: [
                SectionHeading(title: "Account Settings"),
                SizedBox(height: SizesLW.spaceBtwItems),
                CustomMenuTile(
                    title: "My Address",
                    subTitle: "Set shopping delivery address",
                    iconData: Iconsax.safe_home,
                    onTap: () => Get.to(() => Addresses())),
                CustomMenuTile(
                    title: "My Cart",
                    subTitle: "Add, remove products and move to checkout",
                    iconData: Iconsax.shopping_cart),
                CustomMenuTile(
                    title: "My Orders",
                    subTitle: "In-progress and complete orders",
                    iconData: Iconsax.bag_tick,
                    onTap: () => Get.to(() => OrderScreen())),
                CustomMenuTile(
                    title: "Bank Account",
                    subTitle: "Withdraw balance to registerd bank account",
                    iconData: Iconsax.bank),
                CustomMenuTile(
                    title: "My Coupons",
                    subTitle: "List of all the discounted coupons",
                    iconData: Iconsax.discount_shape),
                CustomMenuTile(
                    title: "Notifications",
                    subTitle: "Set any kind of notification message",
                    iconData: Iconsax.notification),
                CustomMenuTile(
                    title: "Account Privacy",
                    subTitle: "Manage data usage and connected accounts",
                    iconData: Iconsax.security_card),

                /// App Settings
                SizedBox(
                  height: SizesLW.spacesBtwSections,
                ),
                SectionHeading(title: "App Settings", showActionButton: false),
                SizedBox(height: SizesLW.spaceBtwItems),
                CustomMenuTile(
                  title: "Load Data",
                  subTitle: "Upload Data to your cloud firebase",
                  iconData: Iconsax.document_upload,
                  onTap: () => Get.to(() => UploadDataScreen()),
                ),
                CustomMenuTile(
                    title: "Geolocation",
                    subTitle: "Set recommendation based on location",
                    iconData: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value) {})),
                CustomMenuTile(
                    title: "Safe Mode",
                    subTitle: "Search result is safe for all ages",
                    iconData: Iconsax.security_user,
                    trailing: Switch(value: true, onChanged: (value) {})),
                CustomMenuTile(
                    title: "HD Image Quality",
                    subTitle: "Set image quality to be seen",
                    iconData: Iconsax.image,
                    trailing: Switch(value: true, onChanged: (value) {})),

                /// Logout button
                SizedBox(height: SizesLW.spacesBtwSections),
                SizedBox(
                  width: double.infinity,
                  child:
                      OutlinedButton(onPressed: () {}, child: Text("Logout")),
                ),
                SizedBox(height: SizesLW.spacesBtwSections * 2.5),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
