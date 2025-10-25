import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/data/repositories/products_repos/product_repo.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  /// creat instance of product repository
  final repository = ProductRepo.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  /// fetchProductByQuery
  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final productsByQuery = await repository.fetchProductByQuery(query);
      return productsByQuery;
    } catch (e) {
      LoggerHelper.errorSnakebar(title: "Oh Snap");
      return [];
    }
  }

  /// Sorted Products
  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;
    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;

      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  /// assign Products
  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
