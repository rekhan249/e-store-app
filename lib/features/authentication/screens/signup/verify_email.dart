import 'package:e_store_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_store_app/features/authentication/screens/login/login_screen.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => LoginScreen()),
              icon: Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesLW.defaultSpaces),
          child: Column(
            children: [
              /// Image
              SizedBox(height: SizesLW.spacesBtwSections),

              /// Title and Subtilte
              Text(TextStrings.confirmEmailTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              SizedBox(height: SizesLW.spaceBtwItems),
              Text("REKhan7562@gmail.com",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              SizedBox(height: SizesLW.spaceBtwItems),
              Text(TextStrings.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              SizedBox(height: SizesLW.spacesBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => SuccessScreen(
                            image: ImageStrings.successfullpayment,
                            title: TextStrings.yourAccountCreateTitle,
                            subTitle: TextStrings.yourAccountCreateSubTitle,
                            onPressed: () => Get.to(() => LoginScreen()),
                          )),
                      child: Text(TextStrings.cont))),
              SizedBox(height: SizesLW.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: Text(TextStrings.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
