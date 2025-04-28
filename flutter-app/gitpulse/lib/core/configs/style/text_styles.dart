import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';

import '../../constants/string_constants.dart';

class AppTextStyle {
  static const TextStyle headingh1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 42,
    fontFamily: AppStrings.figtree,
    letterSpacing: -2,
  );

  static const TextStyle headingh2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 35,
    color: Palette.textHeading,
    fontFamily: AppStrings.figtree,
    letterSpacing: -2,
  );

  static const TextStyle headingh3 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 30,
    color: Palette.textHeading,
    fontFamily: AppStrings.figtree,
  );

  static const TextStyle headingh4 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Palette.textHeading,
    fontFamily: AppStrings.figtree,
  );

  static const TextStyle headingh4Bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Palette.textHeading,
    fontFamily: AppStrings.figtree,
  );
  static const TextStyle headingh5 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: Palette.textHeading,
    fontFamily: AppStrings.figtree,
  );
  static const TextStyle headingh6 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: Palette.textHeading,
    fontFamily: AppStrings.figtree,
  );

  static TextStyle title = TextStyle(
    fontSize: 18,
    color: Palette.textBodySecond,
    fontWeight: FontWeight.w500,
    fontFamily: AppStrings.figtree,
  );

  static const TextStyle subtitleS1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  static const TextStyle subtitleS2 = TextStyle(
    fontSize: 18,
  );

  static const TextStyle subtitles3 = TextStyle(
    fontSize: 17,
  );

  static const TextStyle bodyb1 =
      TextStyle(fontSize: 14, fontFamily: AppStrings.inter);
  static const TextStyle bodyb2 =
      TextStyle(fontSize: 13, fontFamily: AppStrings.inter);

  static TextStyle bodyb1Bold = bodyb1.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle bodyb2Bold = bodyb2.copyWith(
    fontWeight: FontWeight.w600,
  );

  static const TextStyle captionC1 = TextStyle(
    fontSize: 12,
    fontFamily: AppStrings.inter,
  );

  static const TextStyle captionC2 = TextStyle(
    fontSize: 11,
    fontFamily: AppStrings.inter,
  );

  static TextStyle captionC1bold = captionC1.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle captionC2bold = captionC2.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonLarge =
      bodyb1.copyWith(fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle buttonMedium =
      bodyb1.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle buttonSmall =
      bodyb1.copyWith(fontSize: 13, fontWeight: FontWeight.w600);
}
