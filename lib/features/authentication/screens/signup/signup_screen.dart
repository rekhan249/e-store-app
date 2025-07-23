import 'package:e_store_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunc.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(SizesLW.defaultSpaces),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(TextStrings.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: SizesLW.spacesBtwSections),

            /// Form
            SignUpForm(dark: dark)
          ],
        ),
      ),
    );
  }
}
