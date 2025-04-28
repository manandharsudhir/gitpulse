import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

showDeleteDialog(
    {required BuildContext context,
    required String title,
    required VoidCallback onDelete}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        child: DeleteDialogContent(
          onDelete: onDelete,
          title: title,
        ),
      );
    },
  );
}

class DeleteDialogContent extends StatelessWidget {
  const DeleteDialogContent({
    super.key,
    required this.onDelete,
    required this.title,
  });
  final String title;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Palette.errorLight,
            radius: 27,
            child: SvgImageBuilder(
              svgPath: Assets.icons.deleteBig,
              height: 32,
              width: 32,
            ),
          ),
          Spacing.sizedBoxH_40(),
          Text(
            "Delete",
            style: AppTextStyle.headingh4,
          ),
          Spacing.sizedBoxH_08(),
          Text(
            title,
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
                text: "Delete",
                onPressed: onDelete,
                bgColor: Palette.errorBase,
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

class AccountDeleteDialogContent extends StatelessWidget {
  const AccountDeleteDialogContent({
    super.key,
    required this.onDelete,
    required this.title,
  });
  final String title;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Palette.errorLight,
            radius: 27,
            child: SvgImageBuilder(
              svgPath: Assets.icons.deleteBig,
              height: 32,
              width: 32,
            ),
          ),
          Spacing.sizedBoxH_20(),
          Text(
            title,
            style: AppTextStyle.headingh6,
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
                text: "Delete",
                onPressed: onDelete,
                bgColor: Palette.errorBase,
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
