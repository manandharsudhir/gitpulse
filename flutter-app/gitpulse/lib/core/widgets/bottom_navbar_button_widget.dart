import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';

class BottomNavbarButtonWidget extends StatelessWidget {
  const BottomNavbarButtonWidget({
    super.key,
    required this.btnText,
    required this.onButtonPressed,
    this.isDisabled = false,
  });
  final VoidCallback onButtonPressed;
  final String btnText;
  final bool isDisabled;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -8),
                  blurRadius: 24,
                  color: Palette.shadowColor,
                )
              ],
              color: Palette.whiteColor,
            ),
            padding: EdgeInsets.all(16)
                .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CustomButton(
              text: btnText,
              buttonVariant: ButtonVariant.primary,
              isDisabled: isDisabled,
              onPressed: onButtonPressed,
            ),
          ),
        ],
      ),
    );
  }
}
