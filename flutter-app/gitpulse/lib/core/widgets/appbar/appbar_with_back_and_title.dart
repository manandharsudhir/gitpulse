import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';

AppBar appbarWithBackAndTitle(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: AppTextStyle.headingh5,
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Divider(),
    ),
  );
}
