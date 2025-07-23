import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final carousalCurrentIndex = 0.obs;

  /// update to an index
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
