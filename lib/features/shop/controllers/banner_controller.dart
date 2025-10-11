import 'package:e_store_app/utils/logging/logger.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;

  /// update to an index
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  final isloading = false.obs;

  /// load category data
  Future<void> fetchCategories() async {
    try {
      isloading.value = true;
    } catch (e) {
      LoggerHelper.errorSnakebar(title: "Oh Snap");
    } finally {
      isloading.value = false;
    }
  }
}
