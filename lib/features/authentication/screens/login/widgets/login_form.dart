import 'package:e_store_app/features/authentication/screens/password_config/forget_password.dart';
import 'package:e_store_app/features/authentication/screens/signup/signup_screen.dart';
import 'package:e_store_app/navigate_menu.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: SizesLW.spacesBtwSections),
        child: Column(children: [
          /// Email field
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TextStrings.email),
          ),
          SizedBox(height: SizesLW.spaceBtwInputFields),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TextStrings.password,
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          SizedBox(height: SizesLW.spaceBtwInputFields / 2),

          /// Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember Me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text(TextStrings.rememberMe),
                ],
              ),

              /// Forget Password
              TextButton(
                  onPressed: () => Get.to(() => ForgetPassword()),
                  child: Text(TextStrings.forgetPassword))
            ],
          ),

          SizedBox(height: SizesLW.spacesBtwSections),

          /// Sign in button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => NavigateMenu()),
                  child: Text(TextStrings.signIn))),
          SizedBox(height: SizesLW.spaceBtwItems),

          /// Create account button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => SignupScreen()),
                  child: Text(TextStrings.createAccount))),
          SizedBox(height: SizesLW.spacesBtwSections),
        ]),
      ),
    );
  }
}
