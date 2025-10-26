import 'package:e_store_app/common/styles/shimmer_effect.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/brand_showcase.dart';
import 'package:e_store_app/features/shop/controllers/brand_controller.dart';
import 'package:e_store_app/features/shop/models/category_model.dart';
import 'package:e_store_app/utils/helpers/cloud_helper.dart';
import 'package:flutter/material.dart';

class CategoryBrand extends StatelessWidget {
  final CategoryModel category;
  const CategoryBrand({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final brandControll = BrandController.instance;
    return FutureBuilder(
        future: brandControll.getBrandCategory(category.id),
        builder: (context, snapshot) {
          final brands = snapshot.data;
          const loader = ShimmerEffect();
          final widget = CloudHelper.checkingMultipleRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: brands!.length,
              itemBuilder: (context, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: brandControll.getBrandProducts(
                        brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      final products = snapshot.data;
                      const loader = ShimmerEffect();
                      final widget = CloudHelper.checkingMultipleRecordState(
                          snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;
                      return BrandShowCase(
                          brand: brand,
                          images: products!.map((e) => e.thumbnail).toList());
                    });
              });
        });
  }
}
