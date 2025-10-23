import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/common/styles/shimmer_effect.dart';
import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/products/sortablepro/sortable_products.dart';
import 'package:e_store_app/features/shop/controllers/all_products_controller.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar:
          CustomAppbar(title: Text("Popular Products"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesLW.defaultSpaces),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductByQuery(query),
              builder: (context, snapshot) {
                const loader = ShimmerEffect();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }
                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return Center(child: Text("Data not found"));
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }
                final products = snapshot.data;
                return CustomSortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}
