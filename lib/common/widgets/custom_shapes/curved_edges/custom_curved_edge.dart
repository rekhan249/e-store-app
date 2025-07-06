import 'package:flutter/material.dart';

class CustomCurvedEdge extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    /// First Quadrant
    final firstInitCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstInitCurve.dx, firstInitCurve.dy, lastCurve.dx, lastCurve.dy);

    /// Second Quadrant
    final secondInitCurve = Offset(0, size.height - 20);
    final seclastCurve = Offset(size.height - 30, size.height - 20);
    path.quadraticBezierTo(secondInitCurve.dx, secondInitCurve.dy,
        seclastCurve.dx, seclastCurve.dy);

    /// Third Quadrant
    final thirdInitCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdInitCurve.dx, thirdInitCurve.dy,
        thirdLastCurve.dx, thirdLastCurve.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
