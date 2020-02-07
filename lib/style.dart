import 'package:flutter/material.dart';

class AppColor {
  static const Color background = Color(0xFF121212);
  static const Color cardBackground = Color(0x0DFFFFFF);
  static const Color navBar = Color(0x14FFFFFF);
  static const Color divider = Color(0x24FFFFFF);
  static const Color imageOverlay = Color(0x73121212);

  static const LinearGradient gradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFFFF6C1A),
      Color(0xFFF01844),
      Color(0xFF7E0BC9),
    ],
    stops: [
      0.0,
      .528,
      1.0,
    ],
  );
}

class AppFontSize {
  static const double h1 = 36.0;
  static const double h2 = 28.0;
  static const double h3 = 22.0;
  static const double p1 = 18.0;
  static const double p2 = 16.0;
  static const double p3 = 14.0;
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

class AppTextStyle {
  static const TextStyle pageHeader = TextStyle(
    color: AppTextColor.title,
    fontSize: AppFontSize.h2,
    fontWeight: AppFontWeight.bold,
  );

  static const TextStyle giantTitle = TextStyle(
      color: AppTextColor.title,
      fontSize: AppFontSize.h1,
      fontWeight: FontWeight.bold);

  static const TextStyle largeTitle = TextStyle(
      color: AppTextColor.title,
      fontSize: AppFontSize.h2,
      fontWeight: FontWeight.bold);

  static const TextStyle smallTitle = TextStyle(
      color: AppTextColor.title,
      fontSize: AppFontSize.h3,
      fontWeight: FontWeight.bold);

  static const TextStyle largeSubtitle = TextStyle(
    color: AppTextColor.highEmphasis,
    fontSize: AppFontSize.p1,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle smallSubtitle = TextStyle(
    color: AppTextColor.highEmphasis,
    fontSize: AppFontSize.p2,
    fontWeight: FontWeight.normal,
  );
}
