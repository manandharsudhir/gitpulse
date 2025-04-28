import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/form_widget/form_field_widget.dart';
import 'package:gitpulse/features/dashboard/provider/logs_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddFormWidget extends HookConsumerWidget {
  const AddFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final descCon = useTextEditingController();
    final hourCon = useTextEditingController();
    final projectTitleCon = useTextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add Log",
          style: AppTextStyle.headingh3,
        ),
        Spacing.sizedBoxH_40(),
        FormFieldWidget(
          controller: projectTitleCon,
          name: "projectTitle",
          labelText: "Project Title",
        ),
        FormFieldWidget(
          name: "description",
          labelText: "Description",
          controller: descCon,
        ),
        Spacing.sizedBoxH_10(),
        FormFieldWidget(
          name: "hour",
          labelText: "Hour",
          controller: hourCon,
        ),
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
              text: "Save",
              onPressed: () {
                ref.read(logsProvider.notifier).addLogs(
                      projectName: projectTitleCon.text,
                      subtitle: descCon.text,
                      hour: int.tryParse(hourCon.text) ?? 0,
                    );
                context.maybePop();
              },
              borderRadius: 99,
            ),
          ],
        )
      ],
    );
  }
}
