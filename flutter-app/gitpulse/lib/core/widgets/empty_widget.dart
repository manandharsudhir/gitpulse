import 'package:flutter/widgets.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.imagePath});
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SvgImageBuilder(
              svgPath: imagePath ?? Assets.images.empty,
              height: 142,
              width: 240,
              fit: BoxFit.contain,
            ),
          ),
          Spacing.sizedBoxH_16(),
          Text(
            "No Data Available",
            style: AppTextStyle.bodyb1,
          ),
        ],
      ),
    );
  }
}
