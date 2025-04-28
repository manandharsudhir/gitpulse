import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';

class DeleteFormWidget extends StatelessWidget {
  const DeleteFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Are you sure?",
          style: AppTextStyle.headingh3,
        ),
        Spacing.sizedBoxH_10(),
        Text(
          "You'll lose your data.",
          style: AppTextStyle.bodyb1,
        ),
        Spacing.sizedBoxH_40(),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              borderRadius: 99,
              text: "Cancel",
              buttonVariant: ButtonVariant.secondary,
              onPressed: () {
                context.maybePop();
              },
            ),
            Spacing.sizedBoxW_16(),
            CustomButton(
              text: "Yes, Delete",
              borderRadius: 99,
            ),
          ],
        )
      ],
    );
  }
}
