import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';

class FormTitleWidget extends StatelessWidget {
  const FormTitleWidget({
    super.key,
    required this.title,
    this.subtitle = "",
    this.hasDivider = true,
  });
  final String title;
  final String subtitle;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.headingh6,
        ),
        if (subtitle.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.sizedBoxH_08(),
              Text(
                subtitle,
                style: AppTextStyle.captionC1.copyWith(
                  color: Palette.captionTextColor,
                ),
              ),
            ],
          ),
        if (hasDivider) ...[
          Spacing.sizedBoxH_08(),
          const Divider(
            height: 0,
          ),
        ]
      ],
    );
  }
}
