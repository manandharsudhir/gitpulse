import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets.gen.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    required this.url,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.height = 32,
    this.width = 32,
    this.borderRadius,
    this.childWidget,
    this.shape = BoxShape.rectangle,
    this.textStyle,
    this.colorCode,
    this.color,
    this.blendMode,
    super.key,
  });

  final String url;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadiusGeometry? borderRadius;
  final Widget? childWidget;
  final TextStyle? textStyle;
  final String? colorCode;
  final BlendMode? blendMode;
  final Color? color;

  /// box shape of image widget if you want to change it to circle then apply [BoxShape.circle]
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            shape: shape, borderRadius: borderRadius, color: Colors.black12),
        height: height,
        width: width,
        child:
            // ignore: prefer_if_null_operators
            childWidget != null
                ? childWidget
                : url.isEmpty
                    ? ImageStaticWidget(
                        height: height,
                        width: width,
                        textStyle: textStyle,
                        colorCode: colorCode,
                      )
                    : CachedNetworkImage(
                        imageUrl: url,
                        height: height,
                        width: width,
                        fit: fit,
                        colorBlendMode: blendMode,
                        color: color,
                        // progressIndicatorBuilder: (context, url, progress) =>
                        //     CircularProgressIndicator(),
                        placeholder: (context, url) =>
                            placeholder ?? CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            errorWidget ??
                            ImageStaticWidget(
                              height: height,
                              width: width,
                              textStyle: textStyle,
                              colorCode: colorCode,
                            )));
  }
}

class ImageStaticWidget extends StatelessWidget {
  const ImageStaticWidget({
    super.key,
    this.height,
    this.width,
    this.textStyle,
    this.colorCode,
  });
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final String? colorCode;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      // logoH,
      Assets.logo.webpoint,
      fit: BoxFit.contain,
      height: height,
      width: width,
    );
  }
}
