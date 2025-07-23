import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/custom_shapes/curved_edges/custom_curved_edge.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:flutter/material.dart';

class CustomCurvedClipPath extends StatelessWidget {
  final Widget child;
  const CustomCurvedClipPath({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurvedEdge(), child: child);
  }
}

/// CustomCurve structure
class PrimaryHeadCurvedClipPath extends StatelessWidget {
  final Widget child;
  const PrimaryHeadCurvedClipPath({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomCurvedClipPath(
      child: Container(
        padding: EdgeInsets.all(0),
        color: EStoreColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                  backgroundColor:
                      EStoreColors.textWhite.withValues(alpha: 0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                  backgroundColor:
                      EStoreColors.textWhite.withValues(alpha: 0.1)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
