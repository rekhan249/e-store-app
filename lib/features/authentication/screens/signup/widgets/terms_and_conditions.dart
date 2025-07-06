import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        SizedBox(width: SizesLW.spaceBtwItems),
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
