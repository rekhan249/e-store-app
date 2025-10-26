import 'package:e_store_app/common/styles/shimmer_effect.dart';
import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/products/product_and_brands/brand_card.dart';
import 'package:e_store_app/common/widgets/products/sortablepro/sortable_products.dart';
import 'package:e_store_app/features/shop/controllers/brand_controller.dart';
import 'package:e_store_app/features/shop/models/brand_model.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/cloud_helper.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  final BrandModel brand;
  const BrandProducts({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    final brandControll = BrandController.instance;

    return Scaffold(
      appBar: CustomAppbar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesLW.defaultSpaces),
          child: Column(
            children: [
              CustomBrandCard(showBoarder: true, brand: brand),
              SizedBox(height: SizesLW.spacesBtwSections),
              FutureBuilder(
                  future: brandControll.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    const loader = ShimmerEffect();
                    final widget = CloudHelper.checkingMultipleRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    final brandProduct = snapshot.data;
                    return CustomSortableProducts(products: brandProduct);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
