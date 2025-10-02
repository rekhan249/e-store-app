import 'package:e_store_app/features/authentication/controllers/forget_password/forget_pass_controller.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:e_store_app/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPassController = Get.put(ForgetPassController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(SizesLW.defaultSpaces),
        child: Form(
          key: forgetPassController.forgetPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Headings
              Text(TextStrings.forgetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: SizesLW.spaceBtwItems),
              Text(TextStrings.forgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: SizesLW.spacesBtwSections * 2),

              /// Text Field for Email
              TextFormField(
                controller: forgetPassController.email,
                validator: (value) => EValidators.validateEmail(value),
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TextStrings.email),
              ),
              SizedBox(height: SizesLW.spacesBtwSections),

              /// Submition Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>
                        forgetPassController.sendPasswordResetEmail(),
                    child: Text(TextStrings.submit)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
