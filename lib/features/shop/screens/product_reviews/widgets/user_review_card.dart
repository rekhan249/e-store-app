import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/products/ratings/ratings.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunc.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(ImageStrings.proReview2)),
                SizedBox(width: SizesLW.spaceBtwItems),
                Text("REKhan", style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),

        SizedBox(width: SizesLW.spacesBtwSections),

        /// -- Review
        Row(
          children: [
            CustomRatingBarIndicator(rating: 4),
            SizedBox(width: SizesLW.spaceBtwItems),
            Text("01 July,2025", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(width: SizesLW.spaceBtwItems),
        ReadMoreText(
          "The user interface of the app is intuitive.",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: "show less",
          trimCollapsedText: "show more",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: EStoreColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: EStoreColors.primary),
        ),
        SizedBox(width: SizesLW.spaceBtwItems),
        CircularContainer(
          backgroundColor: isDark ? EStoreColors.darkerGrey : EStoreColors.grey,
          child: Padding(
            padding: EdgeInsets.all(SizesLW.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("RE's Store",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text("02 July, 2025",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: SizesLW.spacesBtwSections),
      ],
    );
  }
}
