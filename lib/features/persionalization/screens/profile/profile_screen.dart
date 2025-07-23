import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/image/circular_image.dart';
import 'package:e_store_app/common/widgets/texts/section_heading.dart';
import 'package:e_store_app/features/persionalization/screens/profile/widgets/custom_pro_menu.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    CircularImage(
                        image: ImageStrings.rek, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
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
                  title: "Name", value: "Coding with REKham", onPressed: () {}),
              CustomProfileMenu(
                  title: "Username",
                  value: "Coding with REKham",
                  onPressed: () {}),
              SizedBox(height: SizesLW.spaceBtwItems),
              Divider(),
              SizedBox(height: SizesLW.spaceBtwItems),
              SectionHeading(
                  title: "Personal Information", showActionButton: false),
              SizedBox(height: SizesLW.spaceBtwItems),
              CustomProfileMenu(
                  title: "User ID",
                  value: "5226",
                  iconData: Iconsax.copy,
                  onPressed: () {}),
              CustomProfileMenu(
                  title: "E-mail",
                  value: "rekhan2490@gmail.com",
                  onPressed: () {}),
              CustomProfileMenu(
                  title: "Phone No.",
                  value: "+92-347-8118327",
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
                    onPressed: () {},
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
