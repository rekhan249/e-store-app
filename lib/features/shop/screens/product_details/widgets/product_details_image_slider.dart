import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/custom_shapes/curved_edges/clippath_custom_curved.dart';
import 'package:e_store_app/common/widgets/icons/circular_icon.dart';
import 'package:e_store_app/common/widgets/image/image_round.dart';
import 'package:e_store_app/features/shop/controllers/images_controller.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSilder extends StatelessWidget {
  final ProductModel product;
  const ProductImageSilder({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return CustomCurvedClipPath(
        child: Container(
      color: isDark ? EStoreColors.darkGrey : EStoreColors.light,
      child: Stack(
        children: [
          SizedBox(
            width: 400,
            child: Padding(
              padding: EdgeInsets.all(SizesLW.productImageRadius * 2),
              child: Center(
                child: Obx(
                  () {
                    final image = controller.selectProductImage.value;
                    return CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: EStoreColors.primary),
                    );
                  },
                ),
              ),
            ),
          ),

          /// Image Slider
          Positioned(
            right: 0,
            bottom: 30,
            left: SizesLW.defaultSpaces,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final selectedimage =
                        controller.selectProductImage.value = images[index];
                    return Obx(
                      () => ImageRoundHome(
                          width: 80,
                          isNetworkImage: true,
                          padding: EdgeInsets.all(SizesLW.sm),
                          border: Border.all(
                              color: selectedimage.isNotEmpty
                                  ? EStoreColors.primary
                                  : Colors.transparent),
                          backgroundColor:
                              isDark ? EStoreColors.dark : EStoreColors.white,
                          imageUrl: images[index]),
                    );
                  },
                  separatorBuilder: (_, __) =>
                      SizedBox(width: SizesLW.spaceBtwItems),
                  itemCount: images.length),
            ),
          ),

          /// Appbar Icons
          CustomAppbar(
            showBackArrow: true,
            actions: [
              CircularIcon(
                isDark: isDark,
                icon: Iconsax.heart5,
                color: Colors.red,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    ));
  }
}
