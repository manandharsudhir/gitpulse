import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/form_widget/form_field_widget.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class SearchWidget extends HookConsumerWidget {
  const SearchWidget({
    super.key,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.onSubmitted,
    this.controller,
    this.suffix,
    this.onTapSuffix,
    this.autoFocus = false,
    this.alwaysShowSuffix = false,
    this.collapsOnTap = true,
  });
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String?)? onSubmitted;
  final Widget? suffix;
  final void Function()? onTapSuffix;
  final bool alwaysShowSuffix;
  final bool autoFocus;
  final bool collapsOnTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showClear = useState(alwaysShowSuffix);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Palette.bgLightA,
      ),
      child: Row(
        children: [
          SvgImageBuilder(
            svgPath: Assets.icons.search,
            color: Palette.iconDefault,
          ),
          Spacing.sizedBoxW_16(),
          Expanded(
            child: FormFieldWidget(
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
              shouldCollapsOnTapOutside: collapsOnTap,
              autofocus: autoFocus,
              onEditingComplete: onEditingComplete,
              onSubmitted: onSubmitted,
              onTap: onTap,
              style: AppTextStyle.bodyb1Bold.copyWith(height: 0),
              decoration: InputDecoration(
                hintStyle: AppTextStyle.captionC1.copyWith(height: 0),
                filled: true,
                fillColor: Palette.bgLightA,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Spacing.sizedBoxW_16(),
          suffix ??
              ((controller == null)
                  ? SizedBox.shrink()
                  : showClear.value
                      ? InkWell(
                          child: Icon(
                            Icons.clear,
                            color: Palette.iconDefault,
                          ),
                          onTap: () {
                            controller!.clear();
                            if (onTapSuffix != null) onTapSuffix!();
                          },
                        )
                      : SizedBox.shrink())
        ],
      ),
    );
  }
}
