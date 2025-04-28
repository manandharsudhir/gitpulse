import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class BottomSheetSelectionItemWidget extends HookConsumerWidget {
  const BottomSheetSelectionItemWidget(
      {super.key,
      required this.onTap,
      required this.title,
      this.titleStyle,
      this.isSelected = false});
  final bool isSelected;
  final String title;
  final VoidCallback onTap;
  final TextStyle? titleStyle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Palette.primaryAccent50 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsetsDirectional.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: titleStyle ??
                    AppTextStyle.bodyb1Bold.copyWith(
                      color: Palette.textHeading,
                    ),
              ),
            ),
            SvgImageBuilder(
              svgPath:
                  isSelected ? Assets.icons.radioSelected : Assets.icons.radio,
            ),
          ],
        ),
      ),
    );
  }
}
