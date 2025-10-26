import 'package:e_store_app/data/repositories/brands_repo/brands_repo.dart';
import 'package:e_store_app/data/repositories/products_repos/product_repo.dart';
import 'package:e_store_app/features/shop/models/brand_model.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  /// instance or variables
  RxBool isLoading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepo = Get.put(BrandsRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// -- Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepo.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      LoggerHelper.errorSnakebar(title: "Oh snap!", message: e.toString());
    }
  }

  /// -- Get Brands for category
  Future<List<BrandModel>> getBrandCategory(String categoryId) async {
    try {
      final brand = await brandRepo.getBrandForCategory(categoryId);
      return brand;
    } catch (e) {
      LoggerHelper.errorSnakebar(title: "Oh snap!", message: e.toString());
      return [];
    }
  }

  /// -- Get Brand specific product from yours data source
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepo.instance
          .getProductForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      LoggerHelper.errorSnakebar(title: "Oh snap!", message: e.toString());
      return [];
    }
  }
}
