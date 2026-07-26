// Theme constants ported from mammamind.se's styles/general.css custom
// properties. Values chosen to visually match the source site's palette,
// spacing, and typography scale as closely as Flutter/Material allows.

import 'package:flutter/material.dart';

class MammaMindColors {
  static const bgMain = Color(0xFFDBD0BC);
  static const bgSoft = Color(0xFFF3E6E1);
  static const cardBg = Color(0xFFFFFFFF);
  static const cardBorder = Color(0xFFB89061);
  static const footerBg = Color(0xFFF9F1ED);

  static const textMain = Color(0xFF3A2F2B);
  static const textMainH2 = Color(0xFF262220);
  static const textMuted = Color(0xFF7A6A66);
  static const textWhite = Color(0xFFF0EDE6);
  static const textCompleted = Color(0xFFBD2424);
  static const textOngoing = Color(0xFF107542);

  static const accent = Color(0xFFC28F7A);
  static const accentActive = Color(0xFFF0B49C);
}

class MammaMindRadius {
  static const xl = 35.0;
  static const lg = 16.0;
  static const md = 12.0;
  static const sm = 8.0;
}

class MammaMindSpacing {
  static const xs = 8.0;
  static const sm = 12.0;
  static const md = 20.0;
  static const lg = 40.0;
  static const xl = 64.0;
}

class MammaMindTypography {
  // ponytail: general.css uses viewport-relative clamp() for h1/h2; Flutter
  // has no CSS-clamp equivalent, so these are fixed sizes tuned to look
  // right at typical mobile/desktop widths rather than a literal port.
  static const h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: MammaMindColors.textMain,
  );
  static const h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: MammaMindColors.textMainH2,
  );
  static const lead = TextStyle(
    fontSize: 18,
    height: 1.7,
    color: MammaMindColors.textMain,
  );
  static const body = TextStyle(
    fontSize: 16,
    height: 1.7,
    color: MammaMindColors.textMain,
  );
  static const small = TextStyle(
    fontSize: 14,
    height: 1.7,
    color: MammaMindColors.textMuted,
  );
}

ThemeData buildMammaMindTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: MammaMindColors.bgMain,
    colorScheme: ColorScheme.fromSeed(
      seedColor: MammaMindColors.accent,
      surface: MammaMindColors.bgMain,
    ),
    cardTheme: const CardThemeData(
      color: MammaMindColors.cardBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(MammaMindRadius.md)),
        side: BorderSide(color: MammaMindColors.cardBorder),
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: MammaMindTypography.h1,
      titleLarge: MammaMindTypography.h2,
      bodyLarge: MammaMindTypography.lead,
      bodyMedium: MammaMindTypography.body,
      bodySmall: MammaMindTypography.small,
    ),
  );
}
