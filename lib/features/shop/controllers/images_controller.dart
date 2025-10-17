import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// variables
  RxString selectProductImage = ''.obs;

  ///-- Get All images from product and variation
  List<String> getAllProductImages(ProductModel product) {
    /// use set to add unique images only
    Set<String> images = {};
    // load images
    images.add(product.thumbnail);

    /// Assign thumbnail as selected
    selectProductImage.value = product.thumbnail;

    /// get all images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    /// get all images from the product variations if not null
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((e) => e.image));
    }
    return images.toList();
  }

  ///-- Show Image popup
  void showEnlargeImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizesLW.defaultSpaces,
                        vertical: SizesLW.defaultSpaces * 2),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  SizedBox(height: SizesLW.spacesBtwSections),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                          width: 150,
                          child: OutlinedButton(
                              onPressed: () => Get.back(),
                              child: Text("Close"))))
                ],
              ),
            ));
  }
}
