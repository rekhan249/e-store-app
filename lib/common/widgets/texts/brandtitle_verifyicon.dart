import 'package:e_store_app/common/widgets/texts/brand_title_text.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/enums.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandtitleVerifyicon extends StatelessWidget {
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  const BrandtitleVerifyicon(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = EStoreColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        SizedBox(width: SizesLW.xs),
        Icon(Iconsax.verify5, color: iconColor, size: SizesLW.iconXs)
      ],
    );
  }
}
