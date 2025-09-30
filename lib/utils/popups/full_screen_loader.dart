import 'package:e_store_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (context) => PopScope(
            canPop: false,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: EHelperFunc.isDarkMode(context)
                    ? EStoreColors.dark
                    : EStoreColors.white,
              ),
              child: Column(
                children: [
                  Expanded(child: SizedBox(height: 200)),
                  Expanded(
                      child: AnimationLoader(text: text, animation: animation))
                ],
              ),
            )));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
