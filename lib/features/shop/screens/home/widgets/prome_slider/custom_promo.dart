import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_store_app/common/styles/shimmer_effect.dart';
import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/image/image_round.dart';
import 'package:e_store_app/features/shop/controllers/banner_controller.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isloading.value) {
        ShimmerEffect(width: double.infinity, height: 190);
      }
      if (controller.banners.isEmpty) {
        return Center(child: Text("Data not found"));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, reason) =>
                      controller.carousalCurrentIndex(index)),
              items: controller.banners
                  .map((banner) => ImageRoundHome(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onTap: () => Get.toNamed(banner.targetScreen)))
                  .toList(),
            ),
            SizedBox(height: SizesLW.spaceBtwItems),
            Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    CircularContainer(
                      width: 20,
                      height: 4,
                      margin: EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.carousalCurrentIndex.value == i
                              ? EStoreColors.primary
                              : EStoreColors.grey,
                    ),
                ],
              ),
            )
          ],
        );
      }
    });
  }
}
