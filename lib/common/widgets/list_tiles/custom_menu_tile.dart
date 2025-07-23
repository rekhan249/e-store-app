import 'package:e_store_app/utils/contants/colors.dart';
import 'package:flutter/material.dart';

class CustomMenuTile extends StatelessWidget {
  final String title, subTitle;
  final IconData iconData;
  final Widget? trailing;
  final VoidCallback? onTap;
  const CustomMenuTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.iconData,
      this.trailing,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: Icon(iconData, size: 28, color: EStoreColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
    );
  }
}
