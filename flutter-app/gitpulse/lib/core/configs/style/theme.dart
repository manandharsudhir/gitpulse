import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static final defaultTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Palette.whiteColor,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      color: Palette.whiteColor,
      iconTheme: IconThemeData(color: Palette.iconDefault),
    ),
    dividerColor: Palette.defaultStroke,
    dividerTheme: const DividerThemeData(
      space: 0,
      thickness: 1,
      color: Palette.defaultStroke,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Palette.whiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
    ),
  );
}
