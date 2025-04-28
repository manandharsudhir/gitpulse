import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({
    super.key,
    required this.isSelected,
    required this.child,
  });

  final bool isSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Palette.primaryAccent50 : Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: child),
          isSelected
              ? const Icon(
                  Icons.radio_button_checked,
                  color: Palette.primaryAccent700,
                )
              : const Icon(Icons.radio_button_unchecked),
        ],
      ),
    );
  }
}
