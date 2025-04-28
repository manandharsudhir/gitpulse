import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class CustomButton extends StatefulWidget {
  final String? text;
  final ButtonVariant? buttonVariant;
  final ButtonSize? buttonSize;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? textColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final EdgeInsets? padding;
  final bool hasBorder;
  final bool isDisabled;
  final Function? debounceFunction;
  final String? prefixIcon;
  final String? suffixIcon;
  final double borderRadius;
  final double sizeBetweenPrefixAndText;
  final bool isLoading;
  final double? prefixSize;

  const CustomButton({
    this.textStyle,
    this.onPressed,
    this.debounceFunction,
    this.textColor,
    this.bgColor,
    this.text,
    this.sizeBetweenPrefixAndText = 4,
    this.buttonWidth,
    this.buttonHeight,
    this.padding,
    this.buttonVariant = ButtonVariant.primary,
    this.buttonSize = ButtonSize.medium,
    this.hasBorder = false,
    this.isDisabled = false,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 8,
    this.prefixSize,
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  // for debounce functionality
  // late ValueNotifier<bool> _isEnabled;
  // late Timer _timer;
  // for debounce functionality

  bool onHover = false;
  bool isBtnPressed = false;
  bool isBorderPresent = false;
  double? btnWidth;
  double? btnHeight;
  double? fontSize;
  FontWeight? fontWeight;

  EdgeInsets btnPadding = EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 24,
  );
  Color? btnBgColor = Colors.transparent;
  Color? btnTextColor = Colors.transparent;
  Color? btnBorderColor = Colors.transparent;
  Color? defaultBtnColor = Colors.transparent;
  Color? defaultBtnTextColor = Colors.transparent;
  Color? defaultBtnBorderColor = Colors.transparent;
  double borderWidth = 0;

  void onEntered(bool onEnteredEvent) {
    setState(() {
      onHover = onEnteredEvent;
    });
  }

  void onExit(bool onExitEvent) {
    setState(() {
      onHover = onExitEvent;
      isBtnPressed = onExitEvent;
    });
  }

  void onTapDown(TapDownDetails tapDownDetails) {
    setState(() {
      isBtnPressed = true;
    });
  }

  void onTapUp(TapUpDetails tapUpDetails) {
    setState(() {
      isBtnPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.buttonVariant) {
      case ButtonVariant.primary:
        defaultBtnColor = Palette.button600;
        defaultBtnTextColor = Palette.btnTextColor;
        borderWidth = 0;

        if (widget.isDisabled) {
          btnBgColor = Palette.primaryAccent600.withOpacity(0.5);
          btnTextColor = Palette.btnTextColor;
          borderWidth = 0;
        } else {
          btnBgColor = defaultBtnColor;
          btnTextColor = defaultBtnTextColor;
          btnBorderColor = Colors.transparent;
          borderWidth = 0;
          if (onHover) {
            btnBgColor = Palette.button700;
            btnBorderColor = Colors.transparent;
            borderWidth = 0;
            if (isBtnPressed) {
              btnBgColor = Palette.button800;
              btnBorderColor = Colors.transparent;
              borderWidth = 0;
            }
          }
        }
        break;
      case ButtonVariant.secondary:
        defaultBtnColor = Palette.whiteColor;
        defaultBtnTextColor = Palette.button700;
        defaultBtnBorderColor = Palette.defaultStroke;
        borderWidth = 1;
        if (widget.isDisabled) {
          btnBgColor = Palette.primaryAccent600.withOpacity(0.5);
          btnTextColor = Palette.button700.withOpacity(0.5);
        } else {
          btnBgColor = defaultBtnColor;
          btnTextColor = defaultBtnTextColor;
          btnBorderColor = defaultBtnBorderColor;
          if (onHover) {
            btnBgColor = Palette.button50;
            btnTextColor = Palette.button700;
            btnBorderColor = Palette.button700;

            if (isBtnPressed) {
              btnBgColor = Palette.button100;
              btnTextColor = Palette.button800;
              btnBorderColor = Palette.button800;
            }
          }
        }
        break;
      case ButtonVariant.tertiary:
        defaultBtnColor = Colors.transparent;
        defaultBtnTextColor = Palette.button700;
        defaultBtnBorderColor = Colors.transparent;
        borderWidth = 0;
        if (widget.isDisabled) {
          btnTextColor = Palette.button700.withOpacity(0.5);
        } else {
          btnBgColor = defaultBtnColor;
          btnTextColor = defaultBtnTextColor;
          btnBorderColor = defaultBtnBorderColor;
          if (onHover) {
            btnBgColor = Palette.button50;
            btnTextColor = Palette.button700;

            if (isBtnPressed) {
              btnBgColor = Palette.button100;
              btnTextColor = Palette.button800;
            }
          }
        }
        break;
      case ButtonVariant.custom:
        if (widget.isDisabled) {
          btnBgColor =
              widget.bgColor ?? Palette.primaryAccent600.withOpacity(0.5);
          btnTextColor = widget.textColor ?? Palette.textDisabled;
        } else {
          if (isBtnPressed) {
            btnBgColor = widget.bgColor;
            borderWidth = widget.buttonWidth ?? 0;
            btnBorderColor = widget.bgColor;
          } else {
            btnBgColor = widget.bgColor;
            btnTextColor = widget.textColor;
            btnBorderColor = Colors.transparent;
            borderWidth = 0;
          }
        }
        break;
      default:
        defaultBtnColor = Palette.button600;
        defaultBtnTextColor = Palette.btnTextColor;
        borderWidth = 0;

        if (widget.isDisabled) {
          btnBgColor = Palette.buttonDisable;
          btnTextColor = Palette.btnTextColor;
          borderWidth = 0;
        } else {
          btnBgColor = defaultBtnColor;
          btnTextColor = defaultBtnTextColor;
          btnBorderColor = Colors.transparent;
          borderWidth = 0;
          if (onHover) {
            btnBgColor = Palette.button700;
            btnBorderColor = Colors.transparent;
            borderWidth = 0;
            if (isBtnPressed) {
              btnBgColor = Palette.button800;
              btnBorderColor = Colors.transparent;
              borderWidth = 0;
            }
          }
        }
    }
    switch (widget.buttonSize) {
      case ButtonSize.small:
        btnPadding = widget.prefixIcon != null
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 9)
                .copyWith(left: 12)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 9);
        fontSize = 14;
        fontWeight = FontWeight.w600;
        // lineHeight = Utils.getLineHeight(14, 14);
        break;
      case ButtonSize.medium:
        btnPadding = widget.prefixIcon != null
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 11)
                .copyWith(left: 12)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 11);
        fontSize = 14;
        fontWeight = FontWeight.w600;
        // lineHeight = Utils.getLineHeight(14, 14);
        break;
      case ButtonSize.large:
        btnPadding = widget.prefixIcon != null
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 13)
                .copyWith(left: 12)
            : const EdgeInsets.symmetric(horizontal: 20, vertical: 13);
        fontSize = 16;
        fontWeight = FontWeight.w600;
        // lineHeight = Utils.getLineHeight(16, 16);
        break;
      default:
        btnPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
        fontSize = 14;
        fontWeight = FontWeight.w600;
        // lineHeight = Utils.getLineHeight(14, 14);
        break;
    }

    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: widget.isDisabled
          ? null
          : () {
              if (widget.onPressed != null) {
                widget.onPressed!();
              }
            },
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        // width: widget.buttonWidth ?? btnWidth,
        // height: widget.buttonHeight ?? btnHeight,
        padding: widget.padding ?? btnPadding,
        decoration: BoxDecoration(
          color: widget.bgColor ?? btnBgColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: btnBorderColor ?? Colors.transparent,
            width: borderWidth,
          ),
        ),
        duration: const Duration(milliseconds: 300),
        child: widget.isLoading
            ? const Center(
                child: SizedBox(
                  height: 14,
                  width: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              )
            : widget.prefixIcon == null && widget.suffixIcon == null
                ? Center(
                    child: Text(
                      widget.text ?? '',
                      textAlign: TextAlign.center,
                      style: widget.textStyle ??
                          AppTextStyle.bodyb1.copyWith(
                            color: btnTextColor,
                            fontSize: fontSize,
                            fontWeight: fontWeight,
                          ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: widget.prefixIcon != null,
                        child: SvgImageBuilder(
                          svgPath: widget.prefixIcon ?? '',
                          color: btnTextColor,
                          height: widget.prefixSize,
                          width: widget.prefixSize,
                        ),
                      ),
                      Visibility(
                        visible: widget.prefixIcon != null,
                        child: SizedBox(
                          width: widget.sizeBetweenPrefixAndText,
                        ),
                      ),
                      Text(
                        widget.text ?? '',
                        textAlign: TextAlign.center,
                        style: widget.textStyle ??
                            AppTextStyle.bodyb1.copyWith(
                              color: btnTextColor,
                              fontSize: fontSize,
                              fontWeight: fontWeight,
                            ),
                      ),
                      Visibility(
                        visible: widget.suffixIcon != null,
                        child: SizedBox(
                          width: widget.sizeBetweenPrefixAndText,
                        ),
                      ),
                      Visibility(
                        visible: widget.suffixIcon != null,
                        child: SvgImageBuilder(
                            svgPath: widget.suffixIcon ?? '',
                            color: btnTextColor),
                      ),
                    ],
                  ),
      ),

      // child: Container(
      //   decoration: BoxDecoration(
      //     color: btnBgColor,
      //     borderRadius: BorderRadius.circular(32),
      //   ),
      //   padding: EdgeInsets.all(14),
      //   child: Text(
      //     widget.text ?? "",
      //     textAlign: TextAlign.center,
      //     // style: AppTextStyle.bodyb1Bold.copyWith(
      //     //   color: Utils.hexToColor(ref
      //     //           .read(tagsProvider.notifier)
      //     //           .getTagById(interest.tags?.id ?? "")
      //     //           .textColor ??
      //     //       "#ffffff"),
      //     // ),
      //   ),
      // ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _timer.cancel();
  // }
}
