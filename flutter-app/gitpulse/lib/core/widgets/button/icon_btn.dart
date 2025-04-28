import 'package:flutter/material.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class IconBtn extends StatelessWidget {
  const IconBtn(
      {super.key,
      required this.func,
      required this.iconStr,
      this.iconColor,
      this.size = const Size(24, 24),
      this.padding = const EdgeInsets.all(8)});
  final VoidCallback func;
  final String iconStr;
  final EdgeInsetsGeometry padding;
  final Color? iconColor;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Padding(
        padding: padding,
        child: SvgImageBuilder(
          svgPath: iconStr,
          height: size.height,
          width: size.width,
          color: iconColor,
        ),
      ),
    );
  }
}
