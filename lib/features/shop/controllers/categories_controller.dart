import 'dart:developer';

import 'package:e_store_app/data/repositories/categories/categories_repo.dart';
import 'package:e_store_app/features/shop/models/category_model.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  final isloading = false.obs;

  final _categoryReposit = Get.put(CategoriesRepo());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuresCategoris = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// load category data
  Future<void> fetchCategories() async {
    try {
      isloading.value = true;

      /// Fetch categories from data souces (Firestore, API etc.)
      final categories = await _categoryReposit.getAllCategories();
      allCategories.assignAll(categories);
      featuresCategoris.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());

      log(featuresCategoris.asMap().toString());

      /// Update categories list

      ///Filter Feature  Categories
    } catch (e) {
      LoggerHelper.errorSnakebar(title: "Oh Snap");
    } finally {
      isloading.value = false;
    }
  }

  /// load selected category data
  /// get category and sub category data
}
