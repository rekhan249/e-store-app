import 'package:e_store_app/common/widget_signinup/form_divider.dart';
import 'package:e_store_app/common/widget_signinup/social_btn.dart';
import 'package:e_store_app/features/authentication/controllers/signup_controller/signup_controller.dart';
import 'package:e_store_app/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:e_store_app/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final signUpControl = Get.put(SignupController());
    return Form(
        key: signUpControl.signUpFormKey,
        child: Column(
          children: [
            Row(
              children: [
                /// first Name
                Expanded(
                    child: TextFormField(
                        controller: signUpControl.firstName,
                        validator: (value) =>
                            EValidators.validateEmptyText("First Name", value),
                        expands: false,
                        decoration: InputDecoration(
                            labelText: TextStrings.firstName,
                            prefixIcon: Icon(Iconsax.user)))),
                SizedBox(width: SizesLW.spaceBtwInputFields),

                /// last Name
                Expanded(
                    child: TextFormField(
                        controller: signUpControl.lastName,
                        validator: (value) =>
                            EValidators.validateEmptyText("Lat Name", value),
                        expands: false,
                        decoration: InputDecoration(
                            labelText: TextStrings.lastName,
                            prefixIcon: Icon(Iconsax.user)))),
              ],
            ),
            SizedBox(height: SizesLW.spaceBtwInputFields),

            /// username
            TextFormField(
                controller: signUpControl.username,
                validator: (value) =>
                    EValidators.validateEmptyText("User Name", value),
                expands: false,
                decoration: InputDecoration(
                    labelText: TextStrings.username,
                    prefixIcon: Icon(Iconsax.user_edit))),
            SizedBox(height: SizesLW.spaceBtwInputFields),

            /// email
            TextFormField(
                controller: signUpControl.email,
                validator: (value) => EValidators.validateEmail(value),
                decoration: InputDecoration(
                    labelText: TextStrings.email,
                    prefixIcon: Icon(Iconsax.direct))),
            SizedBox(height: SizesLW.spaceBtwInputFields),

            ///phone Number
            TextFormField(
                controller: signUpControl.phoneNo,
                validator: (value) => EValidators.validatePhoneNo(value),
                expands: false,
                decoration: InputDecoration(
                    labelText: TextStrings.phoneNo,
                    prefixIcon: Icon(Iconsax.call))),
            SizedBox(height: SizesLW.spaceBtwInputFields),

            /// password
            Obx(
              () => TextFormField(
                  controller: signUpControl.password,
                  validator: (value) => EValidators.validatePassword(value),
                  obscureText: signUpControl.obscurePassword.value,
                  decoration: InputDecoration(
                    labelText: TextStrings.password,
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => signUpControl.obscurePassword.value =
                            !signUpControl.obscurePassword.value,
                        icon: Icon(signUpControl.obscurePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye)),
                  )),
            ),
            SizedBox(height: SizesLW.spacesBtwSections),

            /// Terms and conditions Check
            TermsAndConditions(dark: dark),
            SizedBox(height: SizesLW.spacesBtwSections),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => signUpControl.signup(),
                    child: Text(TextStrings.createAccount))),
            SizedBox(height: SizesLW.spacesBtwSections),
            FormDivider(dark: dark, diverText: TextStrings.orSignUpWith),
            SizedBox(height: SizesLW.spacesBtwSections),
            SocialBtn()
          ],
        ));
  }
}
