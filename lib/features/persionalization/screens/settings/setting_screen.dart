import 'package:e_store_app/common/widgets/Appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/custom_shapes/curved_edges/clippath_custom_curved.dart';
import 'package:e_store_app/common/widgets/image/circular_image.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                ListTile(
                  leading: CircularImage(
                      image: ImageStrings.rek, width: 50, height: 50),
                  title: Text("Coding With RE.K",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: EStoreColors.white)),
                  subtitle: Text("rekhan2490@gmail.com",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: EStoreColors.white)),
                ),
                SizedBox(height: SizesLW.spacesBtwSections),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
