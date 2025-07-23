import 'package:e_store_app/features/shop/screens/product_reviews/widgets/rating_custom_prog_indicator.dart';
import 'package:flutter/material.dart';

class OverallProductRatings extends StatelessWidget {
  const OverallProductRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text("4.8", style: Theme.of(context).textTheme.displayLarge)),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingCustomProgIndicator(text: '5', value: 1.0),
              RatingCustomProgIndicator(text: '4', value: 0.8),
              RatingCustomProgIndicator(text: '3', value: 0.6),
              RatingCustomProgIndicator(text: '2', value: 0.4),
              RatingCustomProgIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
