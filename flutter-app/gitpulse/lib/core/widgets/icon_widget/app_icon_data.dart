import 'package:flutter/material.dart';

import '../../configs/style/colors.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.icon,
    this.size = 18,
    this.color,
    this.useIconColor = false,
  });

  final double size;
  final AppIconData icon;
  final Color? color;
  final bool useIconColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Image.asset(
          icon.imageIcon,
          height: size,
          width: size,
          color: useIconColor ? null : color ?? Palette.primaryAccent600,
        ),
      ),
    );
  }
}

class AppIconData {
  const AppIconData(this.imageIcon);
  final String imageIcon;
}
