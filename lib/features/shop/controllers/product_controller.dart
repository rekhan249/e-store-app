import 'dart:developer';

import 'package:e_store_app/data/repositories/products/product_repo.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/contants/enums.dart';
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

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    /// if mo have any vary price return simple one
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      /// Calculate smallest and largest one
      for (var variation in product.productVariations!) {
        double considerPrice =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        /// Update smallest and largest price
        if (considerPrice < smallestPrice) {
          considerPrice = smallestPrice;
        }

        /// Update smallest and largest price
        if (considerPrice > largestPrice) {
          largestPrice = considerPrice;
        }
      }

      /// if smallest and largest price are the same, return single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        /// otherwise return a price range
        return '$smallestPrice -\$$largestPrice';
      }
    }
  }

  /// Calculate the discount percentage
  String? calSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// -- Check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
