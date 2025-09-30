import 'package:e_store_app/features/authentication/controllers/signup_controller/signup_controller.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final signupControl = SignupController.instance;
    return Row(
      children: [
        SizedBox(
            width: 20,
            height: 20,
            child: Obx(() => Checkbox(
                value: signupControl.privacyPolicy.value,
                onChanged: (value) => signupControl.privacyPolicy.value =
                    !signupControl.privacyPolicy.value))),
        SizedBox(width: SizesLW.spaceBtwItems / 2),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: TextStrings.iAgreeTo,
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: TextStrings.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? EStoreColors.white : EStoreColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        dark ? EStoreColors.white : EStoreColors.primary)),
            TextSpan(
                text: TextStrings.and,
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: TextStrings.termOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? EStoreColors.white : EStoreColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        dark ? EStoreColors.white : EStoreColors.primary)),
          ])),
        ),
      ],
    );
  }
}
