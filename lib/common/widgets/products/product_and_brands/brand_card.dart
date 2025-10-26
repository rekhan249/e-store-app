import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/image/circular_image.dart';
import 'package:e_store_app/common/widgets/texts/brandtitle_verifyicon.dart';
import 'package:e_store_app/features/shop/models/brand_model.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/enums.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class CustomBrandCard extends StatelessWidget {
  final VoidCallback? onTap;
  final bool showBoarder;
  final BrandModel brand;
  const CustomBrandCard(
      {super.key, this.onTap, required this.showBoarder, required this.brand});

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
                isNetworkImage: true,
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
                      title: brand.name, brandTextSize: TextSizes.large),
                  Text("${brand.productsCount ?? 0} Products",
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
