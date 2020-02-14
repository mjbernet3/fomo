import 'package:flutter/material.dart';

class AppColor {
  //Increasing dp is lighter grey
  static const Color background = Color(0xFF121212);
  static const Color dp1 = Color(0x0DFFFFFF);
  static const Color dp2 = Color(0x12121212);
  static const Color dp3 = Color(0x14FFFFFF);
  static const Color dp4 = Color(0x17FFFFFF);
  static const Color dp6 = Color(0x1CFFFFFF);
  static const Color dp8 = Color(0x1FFFFFFF);
  static const Color dp12 = Color(0x24FFFFFF);
  static const Color dp16 = Color(0x26FFFFFF);
  static const Color dp24 = Color(0x29FFFFFF);

  static const Color imageOverlay = Color(0x73121212);

  static const LinearGradient gradient = LinearGradient(
    transform: GradientRotation(-1.0),
    colors: [
      Color(0xFFFF6C1A),
      Color(0xFFF01844),
      Color(0xFF7E0BC9),
    ],
    stops: [
      0.2,
      0.5,
      0.8,
    ],
  );
}

class AppFontSize {
  static const double size36 = 36.0;
  static const double size28 = 28.0;
  static const double size22 = 22.0;
  static const double size18 = 18.0;
  static const double size16 = 16.0;
  static const double size14 = 14.0;
}

class AppFontWeight {
  static const FontWeight bold = FontWeight.w600;
  static const FontWeight normal = FontWeight.w400;
}

class AppFontFamily {
  static const String family = "Raleway";
}

class AppTextColor {
  static const Color title = Color(0xFFFFFFFF);
  static const Color highEmphasis = Color(0xDEFFFFFF);
  static const Color mediumEmphasis = Color(0x99FFFFFF);
  static const Color disabled = Color(0x61FFFFFF);
}
