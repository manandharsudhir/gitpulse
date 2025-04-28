import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageBuilder extends StatelessWidget {
  const SvgImageBuilder({
    super.key,
    required this.svgPath,
    this.height = 24,
    this.width = 24,
    this.fit = BoxFit.cover,
    this.color,
    this.borderRadius = 0,
  });
  final String svgPath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      clipBehavior: Clip.hardEdge,
      height: height,
      width: width,
      child: SvgPicture.asset(
        svgPath,
        fit: fit ?? BoxFit.cover,
        height: height,
        width: width,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        // placeholderBuilder: (context) => SvgImageBuilder(
        //   svgPath: Assets.logo.oneaccordSvg,
        // ),
        // colorFilter:
        //     color ?? const ColorFilter.mode(Palette.primary, BlendMode.srcIn),
      ),
    );
  }
}
