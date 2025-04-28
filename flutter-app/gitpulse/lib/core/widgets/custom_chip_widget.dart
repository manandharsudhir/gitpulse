import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({
    super.key,
    this.padding,
    required this.text,
    this.color,
    this.textStyle,
    this.suffixIcon = "",
    this.suffixIconColor,
  });

  final EdgeInsetsGeometry? padding;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final String suffixIcon;
  final Color? suffixIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color ?? Palette.primaryAccent100,
      ),
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: textStyle ??
                AppTextStyle.captionC2bold.copyWith(
                  color: Palette.whiteColor,
                ),
          ),
          if (suffixIcon.isNotEmpty) ...[
            SizedBox(width: 4),
            SvgImageBuilder(
              svgPath: suffixIcon,
              height: 14,
              width: 14,
              color: suffixIconColor,
            ),
          ],
        ],
      ),
    );
  }
}
