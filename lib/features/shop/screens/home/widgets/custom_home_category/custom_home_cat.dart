import 'package:e_store_app/common/widgets/text_image/vertical_text_image.dart';
import 'package:flutter/material.dart';

class CustomHomeCategories extends StatelessWidget {
  const CustomHomeCategories({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (conustomtext, index) {
            return CustomVerticalTextImage(
                image: '', title: "Shoes Category", onTap: () {}, dark: dark);
          },
        ));
  }
}
