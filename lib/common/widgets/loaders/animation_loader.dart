import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoader extends StatelessWidget {
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  const AnimationLoader(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          SizedBox(height: SizesLW.defaultSpaces),
          Text(text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
          SizedBox(height: SizesLW.defaultSpaces),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: EStoreColors.light),
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: EStoreColors.light),
                      )),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
