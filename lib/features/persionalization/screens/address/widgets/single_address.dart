import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  final bool selectedAddress;
  const SingleAddress({super.key, required this.selectedAddress});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return CircularContainer(
      padding: EdgeInsets.all(SizesLW.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? EStoreColors.primary.withValues(alpha: 0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDark
              ? EStoreColors.darkerGrey
              : EStoreColors.grey,
      margin: EdgeInsets.only(bottom: SizesLW.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? isDark
                        ? EStoreColors.light
                        : EStoreColors.dark.withValues(alpha: 0.6)
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Rehmat Khan",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: SizesLW.sm / 2),
              Text("(+92) 347 8118 327",
                  maxLines: 2, overflow: TextOverflow.ellipsis),
              SizedBox(height: SizesLW.sm / 2),
              Text(
                "Flat No.2c, Street no. 90, sector # I-10/1, Islamabad",
                softWrap: true,
              )
            ],
          ),
        ],
      ),
    );
  }
}
