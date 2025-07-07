import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/image/circular_image.dart';
import 'package:e_store_app/common/widgets/texts/brandtitle_verifyicon.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/enums.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class CustomBrandCard extends StatelessWidget {
  final VoidCallback? onTap;
  final bool showBoarder;
  const CustomBrandCard({super.key, this.onTap, required this.showBoarder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircularContainer(
        padding: EdgeInsets.all(SizesLW.sm),
        showBorder: showBoarder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: CircularImage(
                image: ImageStrings.clotheIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overLayColor: EHelperFunc.isDarkMode(context)
                    ? EStoreColors.white
                    : EStoreColors.black,
              ),
            ),
            SizedBox(width: SizesLW.spaceBtwItems / 2),

            /// --- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandtitleVerifyicon(
                      title: "Nike", brandTextSize: TextSizes.large),
                  Text("250 Products",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
