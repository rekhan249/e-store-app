import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/image/circular_image.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/persionalization/controllers/user_controller_google.dart';
import 'package:e_store_app/features/persionalization/screens/profile/widgets/change_name.dart';
import 'package:e_store_app/features/persionalization/screens/profile/widgets/custom_pro_menu.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserControllerGoogle.instance;
    return Scaffold(
      appBar: CustomAppbar(showBackArrow: true, title: Text("Profile")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizesLW.defaultSpaces),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : ImageStrings.rek;
                      return CircularImage(
                          image: image,
                          width: 80,
                          height: 80,
                          isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUsersProfiePicture(),
                        child: Text("Change profile picture")),
                  ],
                ),
              ),
              SizedBox(height: SizesLW.spaceBtwItems / 2),
              Divider(),
              SectionHeading(
                  title: "Profile Information", showActionButton: false),
              SizedBox(height: SizesLW.spaceBtwItems),
              CustomProfileMenu(
                  title: "Name",
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => ChangeName())),
              CustomProfileMenu(
                  title: "Username",
                  value: controller.user.value.username,
                  onPressed: () {}),
              SizedBox(height: SizesLW.spaceBtwItems),
              Divider(),
              SizedBox(height: SizesLW.spaceBtwItems),
              SectionHeading(
                  title: "Personal Information", showActionButton: false),
              SizedBox(height: SizesLW.spaceBtwItems),
              CustomProfileMenu(
                  title: controller.user.value.id,
                  value: "5226",
                  iconData: Iconsax.copy,
                  onPressed: () {}),
              CustomProfileMenu(
                  title: "E-mail",
                  value: controller.user.value.email,
                  onPressed: () {}),
              CustomProfileMenu(
                  title: "Phone No.",
                  value: controller.user.value.phoneNum,
                  onPressed: () {}),
              CustomProfileMenu(
                  title: "Gender", value: "Male", onPressed: () {}),
              CustomProfileMenu(
                  title: "Date of Birth",
                  value: "1st April,1995",
                  onPressed: () {}),
              Divider(),
              SizedBox(height: SizesLW.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => UserControllerGoogle.instance
                        .deleteAccountWarningPopup(),
                    child: Text(
                      "Close Account",
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
