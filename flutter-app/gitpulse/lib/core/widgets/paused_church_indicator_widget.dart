import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/string_constants.dart';

class PausedChurchIndicator extends StatelessWidget {
  const PausedChurchIndicator({
    this.fromBottomSheet = false,
    super.key,
  });
  final bool fromBottomSheet;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: fromBottomSheet
          ? BoxDecoration(
              color: Palette.errorLight,
              borderRadius: BorderRadiusDirectional.all(Radius.circular(8)))
          : null,
      width: 72,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                fromBottomSheet ? Palette.errorBase : Palette.errorBase,
            radius: 4,
          ),
          Spacing.sizedBoxW_04(),
          Text(AppStrings.paused.toUpperCase(),
              style: fromBottomSheet
                  ? AppTextStyle.captionC2bold.copyWith(
                      color: Palette.warningDark,
                    )
                  : AppTextStyle.captionC1
                      .copyWith(color: Palette.textPlaceholder)),
        ],
      ),
    );
  }
}
