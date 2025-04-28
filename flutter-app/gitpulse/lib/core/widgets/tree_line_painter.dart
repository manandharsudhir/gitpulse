import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';

class TreeLine extends CustomPainter {
  ///The radius, which creates the curved appearance of the chat widget,
  ///has a default value of 10.

  TreeLine({
    this.isFirst = false,
  });

  bool isFirst;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    final paint = Paint()
      ..color = Palette.defaultStroke
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    path.moveTo(16, isFirst ? -28 : -38);
    path.lineTo(16, size.height / 2 - 8);
    path.quadraticBezierTo(16, size.height / 2 + 8, 32, size.height / 2 + 8);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
