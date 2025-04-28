import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class BottomSheetActionItemWidget extends StatelessWidget {
  const BottomSheetActionItemWidget({
    super.key,
    required this.title,
    required this.svgPath,
    required this.onTap,
    this.showDivider = true,
  });
  final String title;
  final String svgPath;
  final VoidCallback onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgImageBuilder(
            svgPath: svgPath,
            color: Palette.iconDefault,
          ),
          Spacing.sizedBoxW_14(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(title),
                ),
                if (showDivider) Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
