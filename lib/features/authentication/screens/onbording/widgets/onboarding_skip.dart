import 'package:e_store_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DeviceUtilities.getAppBarHeight(),
        right: SizesLW.defaultSpaces,
        child: TextButton(
            onPressed: () => OnboardingController.instance.skipPage(),
            child: Text("Skip")));
  }
}
