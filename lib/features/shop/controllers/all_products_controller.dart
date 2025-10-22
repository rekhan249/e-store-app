import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/data/repositories/products/product_repo.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  /// creat instance of product repository
  final repository = ProductRepo.instance;

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
}
