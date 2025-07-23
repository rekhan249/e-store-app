import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeaders extends StatelessWidget {
  const LoginHeaders({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image: AssetImage(
                dark ? ImageStrings.lightAppLogo : ImageStrings.darkAppLogo)),
        Text(TextStrings.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: SizesLW.sm),
        Text(TextStrings.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
