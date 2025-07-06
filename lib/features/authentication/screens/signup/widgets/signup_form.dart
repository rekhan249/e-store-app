import 'package:e_store_app/common/widget_signinup/form_divider.dart';
import 'package:e_store_app/common/widget_signinup/social_btn.dart';
import 'package:e_store_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_store_app/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            /// first Name
            Expanded(
                child: TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                        labelText: TextStrings.firstName,
                        prefixIcon: Icon(Iconsax.user)))),
            SizedBox(width: SizesLW.spaceBtwInputFields),

            /// last Name
            Expanded(
                child: TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                        labelText: TextStrings.lastName,
                        prefixIcon: Icon(Iconsax.user)))),
          ],
        ),
        SizedBox(height: SizesLW.spaceBtwInputFields),

        /// username
        TextFormField(
            expands: false,
            decoration: InputDecoration(
                labelText: TextStrings.username,
                prefixIcon: Icon(Iconsax.user_edit))),
        SizedBox(height: SizesLW.spaceBtwInputFields),

        /// email
        TextFormField(
            decoration: InputDecoration(
                labelText: TextStrings.email,
                prefixIcon: Icon(Iconsax.direct))),
        SizedBox(height: SizesLW.spaceBtwInputFields),

        ///phone Number
        TextFormField(
            expands: false,
            decoration: InputDecoration(
                labelText: TextStrings.phoneNo,
                prefixIcon: Icon(Iconsax.call))),
        SizedBox(height: SizesLW.spaceBtwInputFields),

        /// password
        TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: TextStrings.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            )),
        SizedBox(height: SizesLW.spacesBtwSections),

        /// Terms and conditions Check
        TermsAndConditions(dark: dark),
        SizedBox(height: SizesLW.spacesBtwSections),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => VerifyEmailScreen()),
                child: Text(TextStrings.createAccount))),
        SizedBox(height: SizesLW.spacesBtwSections),
        FormDivider(dark: dark, diverText: TextStrings.orSignUpWith),
        SizedBox(height: SizesLW.spacesBtwSections),
        SocialBtn()
      ],
    ));
  }
}
