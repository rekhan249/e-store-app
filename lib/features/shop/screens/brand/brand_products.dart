import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/products/sortablepro/sortable_products.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text("Nike"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesLW.defaultSpaces),
          child: Column(
            children: [
              CustomSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
