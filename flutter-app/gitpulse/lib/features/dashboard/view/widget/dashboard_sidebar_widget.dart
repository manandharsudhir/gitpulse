import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/image_builder/assets_image_builder.dart';
import 'package:gitpulse/core/widgets/image_builder/image_builder.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';
import 'package:gitpulse/core/widgets/logo_container.dart';

class DashboardSidebarWidget extends StatelessWidget {
  const DashboardSidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Palette.defaultStroke))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LogoContainer(),
          SidebarItemWidget(
            title: "Dashboard",
            url: Assets.icons.layoutDashboard.path,
          ),
          SidebarItemWidget(
            title: "Work Logs",
            url: Assets.icons.logs.path,
          )
        ],
      ),
    );
  }
}

class SidebarItemWidget extends StatelessWidget {
  const SidebarItemWidget({
    super.key,
    required this.title,
    required this.url,
    this.isSelected = false,
  });
  final String title;
  final String url;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          AssetImageBuilder(
            url: url,
            height: 24,
            width: 24,
          ),
          Spacing.sizedBoxW_16(),
          Text(
            title,
            style: AppTextStyle.bodyb1Bold,
          ),
        ],
      ),
    );
  }
}
