import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';

class SecondaryFormWidget extends StatefulWidget {
  const SecondaryFormWidget(
      {super.key,
      required this.name,
      this.controller,
      this.hintText,
      this.labelText,
      this.validator,
      this.inputFormatters,
      this.keyboardType,
      this.maxLength,
      this.maxLines = 1,
      this.errorStyle,
      this.obscureField = false,
      this.onChanged,
      this.onEditingComplete,
      this.onTap,
      this.onSubmitted,
      this.suffix,
      this.initialValue,
      this.readOnly = false,
      this.contentPadding =
          const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      this.textInputAction = TextInputAction.done,
      this.prefix,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixText,
      this.hintStyle,
      this.labelStyle,
      this.style,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.enable = true,
      this.decoration,
      this.node,
      this.autofocus = false,
      this.isFilled = false,
      this.borderRadius,
      this.disabledBorder,
      this.enabledBorder,
      this.errorBorder,
      this.focusedBorder,
      this.fillColor,
      this.alignWithHint = false,
      this.focusedErrorBorder});

  final TextEditingController? controller;
  final String name;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final bool? obscureField;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String?)? onSubmitted;
  final String? initialValue;
  final bool readOnly;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;
  final FocusNode? node;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? errorStyle;
  final TextStyle? labelStyle;
  final AutovalidateMode autovalidateMode;
  final bool enable;
  final bool isFilled;
  final InputDecoration? decoration;
  final bool autofocus;
  final double? borderRadius;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? fillColor;
  final InputBorder? disabledBorder;
  final bool alignWithHint;
  final Widget? suffix;
  @override
  State<SecondaryFormWidget> createState() => _SecondaryFormWidgetState();
}

class _SecondaryFormWidgetState extends State<SecondaryFormWidget> {
  bool _obsecureText = false;
  bool isValidated = false;

  @override
  void initState() {
    super.initState();
    _obsecureText = widget.obscureField == true ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      autofocus: widget.autofocus,
      enabled: widget.enable,
      autocorrect: false,
      initialValue: widget.initialValue,
      focusNode: widget.node,
      validator: widget.validator ?? FormBuilderValidators.required(),
      autovalidateMode: widget.autovalidateMode,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      maxLines: widget.maxLines,
      obscureText: _obsecureText,
      onSubmitted: widget.onSubmitted,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      style: widget.style ??
          AppTextStyle.bodyb1Bold.copyWith(
            height: 0,
          ),
      textAlignVertical: TextAlignVertical.center,
      buildCounter: widget.maxLength != null
          ? (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) =>
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$currentLength of $maxLength character used",
                  style: AppTextStyle.captionC1
                      .copyWith(color: Palette.textPlaceholder),
                ),
              )
          : null,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: widget.decoration ??
          InputDecoration(
            contentPadding: widget.contentPadding,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                AppTextStyle.bodyb1
                    .copyWith(color: Palette.textPlaceholder, height: 0),
            floatingLabelStyle: AppTextStyle.bodyb1
                .copyWith(color: Palette.textPlaceholder, height: 0),
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            alignLabelWithHint: widget.alignWithHint,
            prefix: widget.prefix,
            filled: widget.isFilled,
            fillColor: widget.isFilled ? widget.fillColor : null,
            prefixIcon: widget.prefixIcon,
            prefixText: widget.prefixText,
            errorStyle: widget.errorStyle,
            enabledBorder: widget.enabledBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.defaultStroke,
                  ),
                ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Palette.button700,
              ),
            ),
            focusedBorder: widget.focusedBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.button700,
                  ),
                ),
            errorBorder: widget.errorBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.errorBase,
                  ),
                ),
            focusedErrorBorder: widget.focusedErrorBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.errorBase,
                  ),
                ),
            disabledBorder: widget.disabledBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.defaultStroke,
                  ),
                ),
            suffixIcon: widget.obscureField == false
                ? widget.suffixIcon
                : IconButton(
                    onPressed: () {
                      setState(() {
                        _obsecureText = !_obsecureText;
                      });
                    },
                    icon: Icon(
                      _obsecureText == false
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 18,
                    )),
          ),
    );
  }
}
