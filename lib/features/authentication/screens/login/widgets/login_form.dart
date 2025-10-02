import 'package:e_store_app/features/authentication/controllers/login_controller/login_controller.dart';
import 'package:e_store_app/features/authentication/screens/password_config/forget_password.dart';
import 'package:e_store_app/features/authentication/screens/signup/signup_screen.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:e_store_app/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Form(
      key: loginController.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: SizesLW.spacesBtwSections),
        child: Column(children: [
          /// Email field
          TextFormField(
            controller: loginController.email,
            validator: (value) => EValidators.validateEmail(value),
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TextStrings.email),
          ),
          SizedBox(height: SizesLW.spaceBtwInputFields),
          Obx(
            () => TextFormField(
                controller: loginController.password,
                validator: (value) => EValidators.validatePassword(value),
                obscureText: loginController.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TextStrings.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => loginController.hidePassword.value =
                          !loginController.hidePassword.value,
                      icon: Icon(loginController.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                )),
          ),
          SizedBox(height: SizesLW.spaceBtwInputFields / 2),

          /// Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember Me
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                        value: loginController.rememberMe.value,
                        onChanged: (value) => loginController.rememberMe.value =
                            !loginController.rememberMe.value),
                  ),
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
                  onPressed: () => loginController.signin(),
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
