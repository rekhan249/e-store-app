import 'package:e_store_app/utils/contants/colors.dart';
import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.dark, required this.diverText});

  final bool dark;
  final String diverText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark ? EStoreColors.darkGrey : EStoreColors.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5),
        ),
        Text(diverText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
              color: dark ? EStoreColors.darkGrey : EStoreColors.grey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60),
        ),
      ],
    );
  }
}
