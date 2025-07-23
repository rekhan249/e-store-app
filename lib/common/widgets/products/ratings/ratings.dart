import 'package:e_store_app/utils/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class CustomRatingBarIndicator extends StatelessWidget {
  final double rating;
  const CustomRatingBarIndicator({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: EStoreColors.grey,
        itemBuilder: (context, index) =>
            Icon(Iconsax.star1, color: EStoreColors.primary));
  }
}
