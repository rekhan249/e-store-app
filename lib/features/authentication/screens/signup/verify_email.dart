import 'package:e_store_app/data/repositories/authentic_repository.dart';
import 'package:e_store_app/features/authentication/controllers/signup_controller/verify_email_controller.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String? email;
  const VerifyEmailScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticRepository.instance.logout(),
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
              Text(email ?? '',
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
                      onPressed: () => Get.to(
                          () => controller.checkEmailVerificationStatus()),
                      child: Text(TextStrings.cont))),
              SizedBox(height: SizesLW.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendVerifyEmail(),
                      child: Text(TextStrings.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
