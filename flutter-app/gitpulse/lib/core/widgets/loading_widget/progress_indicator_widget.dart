import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgImageBuilder(
              svgPath: Assets.logo.webpoint,
              width: 80,
              height: 80,
            ),
            Spacing.sizedBoxH_16(),
            Text(
              "Preparing...",
              style: AppTextStyle.headingh6.copyWith(
                color: Palette.textHeading,
              ),
            ),
            Spacing.sizedBoxH_04(),
            Text(
              "Wait a few seconds",
              style: AppTextStyle.bodyb2.copyWith(
                color: Palette.textBody,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
