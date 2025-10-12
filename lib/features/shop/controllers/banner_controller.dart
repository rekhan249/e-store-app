import 'package:e_store_app/data/repositories/banners_repo/banners_repository.dart';
import 'package:e_store_app/features/shop/models/banner_model.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;

  /// update to an index
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  final isloading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// load category data
  Future<void> fetchBanners() async {
    try {
      isloading.value = true;

      /// creating of instanc of banner repo
      final bannerRepo = Get.put(BannersRepository());
      final banners = await bannerRepo.fetchBanner();

      /// assign banners to banners of class intance
      this.banners.assignAll(banners);
    } catch (e) {
      LoggerHelper.errorSnakebar(title: "Oh Snap");
    } finally {
      isloading.value = false;
    }
  }
}
