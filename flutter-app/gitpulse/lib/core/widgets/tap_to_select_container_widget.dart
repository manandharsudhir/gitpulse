import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';

class TapToSelectContainerWidget extends StatelessWidget {
  const TapToSelectContainerWidget({
    super.key,
    required this.title,
    this.isSelected = false,
    this.hasError = false,
    required this.func,
    this.selectedIcon = Icons.radio_button_checked,
    this.unselectedIcon = Icons.radio_button_unchecked,
    this.secondaryWidget,
    this.tertiaryWidget,
  });

  final String title;
  final bool isSelected;
  final bool hasError;
  final VoidCallback func;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final Widget? secondaryWidget;
  final Widget? tertiaryWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Palette.primaryAccent50 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isSelected
                    ? Palette.primaryAccent700
                    : hasError
                        ? Palette.errorBase
                        : Palette.defaultStroke)),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                isSelected
                    ? Icon(
                        selectedIcon,
                        color: Palette.primaryAccent700,
                      )
                    : Icon(unselectedIcon),
                Spacing.sizedBoxW_08(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                      ),
                      if (secondaryWidget != null) secondaryWidget!,
                    ],
                  ),
                )
              ],
            ),
            if (tertiaryWidget != null) ...[
              Spacing.sizedBoxH_16(),
              tertiaryWidget!,
            ]
          ],
        ),
      ),
    );
  }
}
