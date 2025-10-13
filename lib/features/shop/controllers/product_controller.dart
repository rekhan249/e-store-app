import 'package:e_store_app/data/repositories/products/product_repo.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  /// loader and featured products
  final isLoading = false.obs;
  final productRepo = Get.put(ProductRepo());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      /// show loader
      isLoading.value = true;

      /// fetch products
      final products = await productRepo.getFeatureProducts();

      /// Assign products
      featuredProducts.assignAll(products);
    } catch (e) {
      LoggerHelper.errorSnakebar(title: "Oh snap");
    } finally {
      isLoading.value = false;
    }
  }

  // String getProductPrice(ProductModel product){
  //   double smallestPrice =double.infinity;
  //   double largestPrice = 0.0;

  //   if(product.productType == ProductType.single.toString()){

  //   }
  // }
}
