import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  const CustomBottomSheetWidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacing.sizedBoxH_08(),
        Container(
          height: 5,
          width: 48,
          decoration: BoxDecoration(
            color: Palette.blackColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child,
      ],
    );
  }
}
