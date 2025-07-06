import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class GridLayoutCustom extends StatelessWidget {
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  const GridLayoutCustom(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent = 288,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: SizesLW.gridViewSpacing / 2,
            crossAxisSpacing: SizesLW.gridViewSpacing / 2,
            mainAxisExtent: mainAxisExtent,
            crossAxisCount: 2),
        itemBuilder: itemBuilder);
  }
}
