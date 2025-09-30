import 'package:e_store_app/features/authentication/controllers/login_controller/login_controller.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialBtn extends StatelessWidget {
  const SocialBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerLogedIn = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: EStoreColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => controllerLogedIn.signingoogle(),
              icon: Image(
                  width: SizesLW.iconMd,
                  height: SizesLW.iconMd,
                  image: AssetImage(ImageStrings.google))),
        ),
        SizedBox(width: SizesLW.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: EStoreColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: Image(
                  width: SizesLW.iconMd,
                  height: SizesLW.iconMd,
                  image: AssetImage(ImageStrings.facebook))),
        )
      ],
    );
  }
}
