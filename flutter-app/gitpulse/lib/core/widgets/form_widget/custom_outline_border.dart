import 'package:flutter/material.dart';

class CustomOutlineInputBorder extends UnderlineInputBorder {
  const CustomOutlineInputBorder({
    super.borderSide,
    super.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(12.0),
      topRight: Radius.circular(12.0),
      bottomLeft: Radius.circular(12.0),
      bottomRight: Radius.circular(12.0),
    ),
  });

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final Paint paint = borderSide.toPaint();
    final RRect outer = borderRadius.toRRect(rect);
    final RRect center = outer.deflate(borderSide.width / 2.0);
    canvas.drawRRect(center, paint);
  }
}
