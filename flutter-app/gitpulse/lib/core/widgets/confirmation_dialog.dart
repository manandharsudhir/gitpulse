import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';

showConfirmationDialog(
    {required BuildContext context,
    required String title,
    required VoidCallback onDelete}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        child: ConfirmationDialog(
          onYes: onDelete,
          title: title,
        ),
      );
    },
  );
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.onYes,
    required this.title,
  });
  final String title;
  final VoidCallback onYes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyle.headingh5,
            textAlign: TextAlign.center,
          ),
          Spacing.sizedBoxH_24(),
          Row(
            children: [
              Expanded(
                  child: CustomButton(
                text: "No",
                buttonVariant: ButtonVariant.secondary,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
              Spacing.sizedBoxW_08(),
              Expanded(
                  child: CustomButton(
                text: "Yes",
                onPressed: onYes,
              )),
            ],
          )
        ],
      ),
    );
  }
}
