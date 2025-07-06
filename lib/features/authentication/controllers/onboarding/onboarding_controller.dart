import 'package:e_store_app/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // create and intialize variables
  final pageController = PageController();
  final currentIndex = 0.obs;

  // update current index on page scrolling
  void updatePageIndex(index) {
    currentIndex.value = index;
  }

  // jump to specific dot page selection
  void navigateOnDotClick(index) {
    currentIndex.value = index;
    pageController.jumpTo(index);
  }

  // update current index and jump to next
  void nextPage() {
    if (currentIndex.value == 2) {
      Get.offAll(() => LoginScreen());
    } else {
      int page = currentIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // update current index and jump to last
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
