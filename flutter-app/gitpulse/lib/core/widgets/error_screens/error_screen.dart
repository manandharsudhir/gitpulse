import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

import '../../configs/spacing_size.dart';
import '../../configs/style/text_styles.dart';
import '../button/custom_button.dart';

@RoutePage()
class ErrorScreen extends HookConsumerWidget {
  final VoidCallback function;
  final String imgString;
  final String title;
  final String subtitle;
  final String btnString;
  final bool showRefresh;
  final Widget? imgWidget;
  const ErrorScreen(
      {super.key,
      required this.function,
      this.showRefresh = true,
      this.imgString = "assets/icons/error.svg",
      this.subtitle = "Try refreshing",
      this.title = "Something wrong occured",
      this.imgWidget,
      this.btnString = "Refresh"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        imgWidget ??
            SvgImageBuilder(
              svgPath: imgString,
              fit: BoxFit.contain,
            ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Text(
                title,
                style: AppTextStyle.headingh4,
                textAlign: TextAlign.center,
              ),
              Spacing.sizedBoxH_08(),
              Visibility(
                visible: subtitle.isNotEmpty,
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyb1,
                ),
              ),
              Visibility(
                visible: showRefresh,
                child: Column(
                  children: [
                    Spacing.sizedBoxH_16(),
                    CustomButton(
                      text: btnString,
                      onPressed: function,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
