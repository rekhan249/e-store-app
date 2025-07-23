import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/common/widgets/products/ratings/ratings.dart';
import 'package:e_store_app/features/shop/screens/product_reviews/widgets/overall_prod_rate.dart';
import 'package:e_store_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// --- Appbar
      appBar: CustomAppbar(
        title: Text("Reviews & Ratings"),
        showBackArrow: true,
      ),

      /// --- body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizesLW.defaultSpaces),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Rating and reviews are verified were from people who use the same type of app that you have"),
              SizedBox(height: SizesLW.spaceBtwItems),

              /// Overall Product Ratings
              OverallProductRatings(),

              /// Rating Bar Indicator
              CustomRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: SizesLW.spacesBtwSections),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
