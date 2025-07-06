import 'package:e_store_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_store_app/features/authentication/screens/onbording/widgets/onboarding_dotnav.dart';
import 'package:e_store_app/features/authentication/screens/onbording/widgets/onboarding_page.dart';
import 'package:e_store_app/features/authentication/screens/onbording/widgets/onboarding_skip.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:e_store_app/utils/device/device_utilities.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerPage = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable Pages
          PageView(
            controller: controllerPage.pageController,
            onPageChanged: (value) => controllerPage.updatePageIndex(value),
            children: [
              OnBoardingPage(
                  image: ImageStrings.onboardingImage1,
                  title: TextStrings.onBoardingTitle1,
                  subTitle: TextStrings.onBoardingSubTitle1),
              OnBoardingPage(
                  image: ImageStrings.onboardingImage2,
                  title: TextStrings.onBoardingTitle2,
                  subTitle: TextStrings.onBoardingSubTitle2),
              OnBoardingPage(
                  image: ImageStrings.onboardingImage3,
                  title: TextStrings.onBoardingTitle3,
                  subTitle: TextStrings.onBoardingSubTitle3),
            ],
          ),
          // Skip Button
          OnBoardingSkip(),
          // Navigation of dot page
          OnboardingDotNav(),
          //Circular button
          OnboardingNext()
        ],
      ),
    );
  }
}

class OnboardingNext extends StatelessWidget {
  const OnboardingNext({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunc.isDarkMode(context);
    return Positioned(
        right: SizesLW.defaultSpaces,
        bottom: DeviceUtilities.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            onPressed: () => OnboardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: dark ? EStoreColors.primary : Colors.black),
            child: Icon(Icons.keyboard_arrow_right_outlined)));
  }
}
