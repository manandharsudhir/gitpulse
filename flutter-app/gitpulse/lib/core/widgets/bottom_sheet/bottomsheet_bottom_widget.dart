import 'package:flutter/material.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';

class BottomSheetBottomWidget extends StatelessWidget {
  const BottomSheetBottomWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.isDisabled = false,
  });
  final String title;
  final VoidCallback onTap;
  final bool isDisabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16).copyWith(bottom: 32),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: Offset(0, -8),
            blurRadius: 24,
          )
        ],
        color: Colors.white,
      ),
      child: CustomButton(
        text: title,
        buttonSize: ButtonSize.medium,
        padding: EdgeInsets.symmetric(
          vertical: 16,
        ),
        isDisabled: isDisabled,
        onPressed: onTap,
      ),
    );
  }
}
