import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/image/image_round.dart';
import 'package:e_store_app/features/shop/controllers/home_controller.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoSlider extends StatelessWidget {
  final List<String> banners;
  const PromoSlider({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) =>
                  controller.carousalCurrentIndex(index)),
          items: banners.map((url) => ImageRoundHome(imageUrl: url)).toList(),
        ),
        SizedBox(height: SizesLW.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                CircularContainer(
                  width: 20,
                  height: 4,
                  margin: EdgeInsets.only(right: 10),
                  backgroundColor: controller.carousalCurrentIndex.value == i
                      ? EStoreColors.primary
                      : EStoreColors.grey,
                ),
            ],
          ),
        )
      ],
    );
  }
}
