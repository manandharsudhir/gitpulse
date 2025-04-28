import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/appbar/appbar_with_back_and_title.dart';
import 'package:gitpulse/core/widgets/appbar/appbar_with_back_only_widget.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class CustomScaffoldForFormWidget extends ConsumerWidget {
  const CustomScaffoldForFormWidget({
    super.key,
    required this.subtitle,
    required this.title,
    required this.imageSrc,
    required this.child,
    this.btnTxt = "Submit",
    this.onButtonPressed,
    this.bottomWidgetAboveButton,
    this.isDisabled = false,
    this.hasIllustration = true,
    this.isPng = false,
    this.imgHeight = 100,
    this.imgWidth = 100,
  });
  final String title;
  final String subtitle;
  final String imageSrc;
  final Widget child;
  final String btnTxt;
  final VoidCallback? onButtonPressed;
  final Widget? bottomWidgetAboveButton;
  final bool isDisabled;
  final bool hasIllustration;
  final bool isPng;
  final double imgHeight;
  final double imgWidth;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: hasIllustration
          ? appbarWithBackOnly(context)
          : appbarWithBackAndTitle(context, title: title),
      body: Column(
        children: [
          if (hasIllustration)
            Container(
              color: Palette.primaryAccent50,
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyle.headingh5,
                          ),
                          Text(
                            subtitle,
                            style: AppTextStyle.bodyb1.copyWith(
                              color: Palette.textBodySecond,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacing.sizedBoxW_08(),
                  isPng
                      ? Image.asset(
                          imageSrc,
                          fit: BoxFit.cover,
                          height: imgHeight,
                          width: imgWidth,
                        )
                      : SvgImageBuilder(
                          svgPath: imageSrc,
                          height: imgHeight,
                          width: imgWidth,
                        )
                ],
              ),
            ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Palette.whiteColor,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: child,
              ),
            ),
          ),
          if (bottomWidgetAboveButton != null) bottomWidgetAboveButton!,
          Container(
            color: Palette.whiteColor,
            padding: const EdgeInsets.all(16).copyWith(bottom: 32),
            child: CustomButton(
              text: btnTxt,
              onPressed: onButtonPressed,
              isDisabled: isDisabled,
            ),
          ),
        ],
      ),
    );
  }
}
