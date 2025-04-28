import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/image_builder/assets_image_builder.dart';
import 'package:gitpulse/core/widgets/image_builder/image_builder.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Dashboard",
          style: AppTextStyle.headingh3,
        ),
        Spacer(),
        Row(
          spacing: 17,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                border: Border.all(
                  color: Color(0x0A0D120D),
                ),
              ),
              child: Row(
                spacing: 4,
                children: [
                  Text(
                    "Add log",
                  ),
                  AssetImageBuilder(
                    url: Assets.icons.png.icPlus.path,
                    width: 22,
                    height: 22,
                  )
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(99)),
            )
          ],
        ),
      ],
    );
  }
}
