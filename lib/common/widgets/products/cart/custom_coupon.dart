import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class CustomCouponCode extends StatelessWidget {
  const CustomCouponCode({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      showBorder: true,
      backgroundColor: isDark ? EStoreColors.dark : EStoreColors.white,
      padding: EdgeInsets.only(
          top: SizesLW.sm,
          bottom: SizesLW.sm,
          left: SizesLW.md,
          right: SizesLW.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Have you a prome code? Enter here',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: isDark
                        ? EStoreColors.white.withValues(alpha: 0.5)
                        : EStoreColors.dark.withValues(alpha: 0.5),
                    backgroundColor: EStoreColors.grey.withValues(alpha: 0.2),
                    side: BorderSide(
                        color: EStoreColors.grey.withValues(alpha: 0.1))),
                child: Text("Apply")),
          )
        ],
      ),
    );
  }
}
