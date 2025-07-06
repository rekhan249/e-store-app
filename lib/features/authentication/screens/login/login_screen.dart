import 'package:e_store_app/common/styles/spacing_style.dart';
import 'package:e_store_app/common/widget_signinup/form_divider.dart';
import 'package:e_store_app/common/widget_signinup/social_btn.dart';
import 'package:e_store_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_store_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunc.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo , Title & Sub-Title
              LoginHeaders(dark: dark),

              /// Form and form's properties
              LoginForm(),

              /// Divider
              FormDivider(
                  dark: dark, diverText: TextStrings.orSignInWith.capitalize!),
              SizedBox(height: SizesLW.spacesBtwSections),

              /// Footer design
              SocialBtn()
            ],
          ),
        ),
      ),
    );
  }
}
