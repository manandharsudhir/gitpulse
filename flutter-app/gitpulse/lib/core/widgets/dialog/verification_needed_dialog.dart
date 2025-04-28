import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/constants/string_constants.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

showVerificationNeededDialog(
    {required BuildContext context, required VoidCallback onSend}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        child: VerificationNeededDialogContent(
          onSend: onSend,
        ),
      );
    },
  );
}

class VerificationNeededDialogContent extends StatelessWidget {
  const VerificationNeededDialogContent({
    super.key,
    required this.onSend,
  });
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Palette.infoLight,
            radius: 50,
            child: SvgImageBuilder(
              svgPath: Assets.icons.mail,
              height: 48,
              width: 48,
            ),
          ),
          Spacing.sizedBoxH_24(),
          Text(
            AppStrings.VerificationNeeded,
            style: AppTextStyle.headingh4,
          ),
          Spacing.sizedBoxH_08(),
          Text(
            AppStrings.VerificationNeededSubtitle,
            style: AppTextStyle.bodyb1,
            textAlign: TextAlign.center,
          ),
          Spacing.sizedBoxH_24(),
          Row(
            children: [
              Expanded(
                  child: CustomButton(
                text: "Cancel",
                buttonVariant: ButtonVariant.secondary,
                textStyle: AppTextStyle.bodyb1Bold
                    .copyWith(color: Palette.textBodySecond),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
              Spacing.sizedBoxW_08(),
              Expanded(
                  child: CustomButton(
                text: "Send",
                onPressed: onSend,
                bgColor: Palette.primaryAccent600,
                textStyle:
                    AppTextStyle.bodyb1Bold.copyWith(color: Palette.whiteColor),
              )),
            ],
          )
        ],
      ),
    );
  }
}
