import 'dart:developer';

import 'package:e_store_app/common/styles/shimmer_effect.dart';
import 'package:e_store_app/common/widgets/text_image/vertical_text_image.dart';
import 'package:e_store_app/features/shop/controllers/categories_controller.dart';
import 'package:e_store_app/features/shop/screens/sub_category/sub_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHomeCategories extends StatelessWidget {
  const CustomHomeCategories({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final categoryControll = Get.put(CategoriesController());
    return Obx(() {
      if (categoryControll.isloading.value) return ShimmerEffect();
      if (categoryControll.featuresCategoris.isEmpty) {
        return Center(
            child: Text("No Data Found",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white)));
      }

      return SizedBox(
          height: 80,
          child: ListView.builder(
            itemCount: categoryControll.featuresCategoris.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = categoryControll.featuresCategoris[index];
              log(category.toMap().toString());
              return CustomVerticalTextImage(
                  image: category.image,
                  title: category.name,
                  onTap: () => Get.to(() => SubCategoryScreen()),
                  dark: dark);
            },
          ));
    });
  }
}
