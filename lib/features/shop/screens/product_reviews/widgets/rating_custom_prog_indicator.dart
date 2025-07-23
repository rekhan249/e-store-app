import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';

class RatingCustomProgIndicator extends StatelessWidget {
  final String text;
  final double value;
  const RatingCustomProgIndicator(
      {super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
            flex: 11,
            child: SizedBox(
              width: DeviceUtilities.getScreenWidth(context) * 0.8,
              child: LinearProgressIndicator(
                value: value,
                minHeight: 11,
                backgroundColor: EStoreColors.grey,
                borderRadius: BorderRadius.circular(7),
                valueColor: AlwaysStoppedAnimation(EStoreColors.primary),
              ),
            ))
      ],
    );
  }
}
