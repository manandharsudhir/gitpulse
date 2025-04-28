import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

showDeniedDialog(
    {required BuildContext context,
    required String title,
    required String subtitle}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        child: DeniedDialogContent(
          subtitle: subtitle,
          title: title,
        ),
      );
    },
  );
}

class DeniedDialogContent extends StatelessWidget {
  const DeniedDialogContent({
    super.key,
    required this.subtitle,
    required this.title,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Palette.warningLight,
            radius: 50,
            child: SvgImageBuilder(
              svgPath: Assets.icons.danger,
              color: Palette.warningDark,
              height: 48,
              width: 48,
            ),
          ),
          Spacing.sizedBoxH_40(),
          Text(
            title,
            style: AppTextStyle.headingh4,
          ),
          Spacing.sizedBoxH_08(),
          Text(
            subtitle,
            style: AppTextStyle.bodyb1,
            textAlign: TextAlign.center,
          ),
          Spacing.sizedBoxH_24(),
          CustomButton(
            text: "Okay",
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
