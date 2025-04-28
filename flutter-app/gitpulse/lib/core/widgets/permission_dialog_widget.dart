import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({
    super.key,
    required this.title,
    required this.subtitle,
    this.onSettingsPressed,
  });
  final String title;
  final String subtitle;
  final VoidCallback? onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyle.headingh5,
            textAlign: TextAlign.center,
          ),
          Spacing.sizedBoxH_08(),
          Text(
            subtitle,
            style: AppTextStyle.bodyb1.copyWith(
              color: Palette.textBodySecond,
            ),
            textAlign: TextAlign.center,
          ),
          Spacing.sizedBoxH_32(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: CustomButton(
                  text: "Cancel",
                  buttonVariant: ButtonVariant.secondary,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Spacing.sizedBoxW_08(),
              Expanded(
                child: CustomButton(
                  text: "Settings",
                  onPressed: () {
                    openAppSettings();
                    if (onSettingsPressed != null) onSettingsPressed!();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
