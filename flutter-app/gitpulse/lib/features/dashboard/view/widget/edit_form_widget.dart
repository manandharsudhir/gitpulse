import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/form_widget/form_field_widget.dart';

class EditFormWidget extends StatelessWidget {
  const EditFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Edit Form",
          style: AppTextStyle.headingh3,
        ),
        Spacing.sizedBoxH_10(),
        FormFieldWidget(
          name: "description",
          labelText: "Description",
        ),
        Spacing.sizedBoxH_10(),
        FormFieldWidget(
          name: "hour",
          labelText: "Hour",
        ),
        Spacing.sizedBoxH_30(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              text: "Save",
              buttonVariant: ButtonVariant.secondary,
            ),
            Spacing.sizedBoxW_16(),
            CustomButton(
              text: "Cancel",
            ),
          ],
        )
      ],
    );
  }
}
