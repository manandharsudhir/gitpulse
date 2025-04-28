import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/form_widget/form_field_widget.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class SecondarySearchWidget extends HookConsumerWidget {
  const SecondarySearchWidget({
    super.key,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.onSubmitted,
    this.controller,
    this.suffix,
    this.onTapSuffix,
    this.alwaysShowSuffix = false,
    this.hintText = "",
  });
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String?)? onSubmitted;
  final Widget? suffix;
  final void Function()? onTapSuffix;
  final bool alwaysShowSuffix;
  final String hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showClear = useState(alwaysShowSuffix);
    return FormFieldWidget(
      name: "search",
      controller: controller,
      onChanged: (value) {
        if ((value ?? "").isNotEmpty) {
          showClear.value = true;
        } else {
          showClear.value = false;
        }
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onTap: onTap,
      decoration: InputDecoration(
        hintStyle: AppTextStyle.bodyb1.copyWith(
          color: Palette.textPlaceholder,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        filled: true,
        fillColor: Palette.whiteColor,
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Palette.defaultStroke,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Palette.defaultStroke,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 0, bottom: 0),
          child: SvgImageBuilder(
            svgPath: Assets.icons.search,
            color: Palette.iconDefault,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
