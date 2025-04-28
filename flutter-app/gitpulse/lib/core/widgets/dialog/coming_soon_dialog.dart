import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';
import 'package:auto_route/auto_route.dart';

comingSoonDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        child: ComingSoonDialogContent(),
      );
    },
  );
}

class ComingSoonDialogContent extends StatelessWidget {
  const ComingSoonDialogContent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgImageBuilder(
            svgPath: Assets.images.comingSoon,
            height: 108,
            width: 108,
          ),
          Spacing.sizedBoxH_40(),
          Text(
            "Coming Soon",
            style: AppTextStyle.headingh4,
          ),
          Spacing.sizedBoxH_08(),
          Text(
            "New features launching soon! Keep an eye out for what's next.",
            style: AppTextStyle.bodyb1,
            textAlign: TextAlign.center,
          ),
          Spacing.sizedBoxH_24(),
          CustomButton(
            text: "Okay",
            onPressed: () {
              context.router.maybePop();
            },
          ),
        ],
      ),
    );
  }
}
