import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/helpers/e_helper_func.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  const CustomChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  @override
  Widget build(BuildContext context) {
    final isColor = EHelperFunc.getColor(text) != null;
    return ChoiceChip(
        label: isColor ? SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? EStoreColors.white : null),
        avatar: isColor
            ? CircularContainer(
                width: 50,
                height: 50,
                backgroundColor: EHelperFunc.getColor(text)!)
            : null,
        shape: isColor ? CircleBorder() : null,
        padding: isColor ? EdgeInsets.all(0) : null,
        labelPadding: isColor ? EdgeInsets.all(0) : null,
        backgroundColor: isColor ? EHelperFunc.getColor(text)! : null);
  }
}
