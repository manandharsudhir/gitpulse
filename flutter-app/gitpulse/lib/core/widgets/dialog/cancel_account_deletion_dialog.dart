import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class CancelAccountDeletionDialog extends StatelessWidget {
  const CancelAccountDeletionDialog({
    super.key,
    required this.title,
    required this.onCancel,
  });

  final String title;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Palette.warningLight,
            radius: 50,
            child: SvgImageBuilder(
              svgPath: Assets.icons.dangerBig,
              height: 48,
              width: 48,
              color: Palette.warningDark,
            ),
          ),
          Spacing.sizedBoxH_20(),
          Text(
            title,
            style: AppTextStyle.headingh4,
            textAlign: TextAlign.center,
          ),
          Spacing.sizedBoxH_08(),
          Text(
            "Your account deletion is in progress and will be completed in 7 days. If you have changed your mind, you can cancel this action now.",
            style: AppTextStyle.bodyb1.copyWith(
              color: Palette.textBody,
            ),
          ),
          Spacing.sizedBoxH_24(),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'No',
                  buttonVariant: ButtonVariant.secondary,
                  textStyle: AppTextStyle.bodyb1Bold
                      .copyWith(color: Palette.textBodySecond),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.symmetric(vertical: 13),
                ),
              ),
              Spacing.sizedBoxW_08(),
              Expanded(
                child: CustomButton(
                  text: "Yes",
                  onPressed: onCancel,
                  buttonVariant: ButtonVariant.primary,
                  padding: EdgeInsets.symmetric(vertical: 13),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
