import 'package:e_store_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/device/device_utilities.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNav extends StatelessWidget {
  const OnboardingDotNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = EHelperFunc.isDarkMode(context);
    return Positioned(
        bottom: DeviceUtilities.getBottomNavigationBarHeight() + 25,
        left: SizesLW.defaultSpaces,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: (index) => controller.navigateOnDotClick(index),
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? EStoreColors.light : EStoreColors.dark,
              dotHeight: 6),
        ));
  }
}
