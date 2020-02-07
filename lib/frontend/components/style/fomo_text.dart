import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/style/fomo_colors.dart';

class FomoFontSize {
  static const double h1 = 36.0;
  static const double h2 = 28.0;
  static const double h3 = 22.0;
  static const double p1 = 18.0;
  static const double p2 = 16.0;
  static const double p3 = 14.0;
}

class FomoFontWeight {
  static const FontWeight bold = FontWeight.w600;
  static const FontWeight normal = FontWeight.w400;
}

class FomoFontFamily {
  static const String global = "Raleway";
}

class FomoTextStyle extends TextStyle {
  static final FomoTextStyle pageHeader = FomoTextStyle(
    color: FomoColor.onPrimary,
    fontSize: FomoFontSize.h2,
    fontWeight: FomoFontWeight.bold,
  );

  static final FomoTextStyle giantTitle = FomoTextStyle(
      color: FomoColor.onPrimary,
      fontSize: FomoFontSize.h1,
      fontWeight: FomoFontWeight.bold);

  static final FomoTextStyle largeTitle = FomoTextStyle(
      color: FomoColor.onPrimary,
      fontSize: FomoFontSize.h2,
      fontWeight: FomoFontWeight.bold);

  static final FomoTextStyle smallTitle = FomoTextStyle(
      color: FomoColor.onPrimary,
      fontSize: FomoFontSize.h3,
      fontWeight: FomoFontWeight.bold);

  static final FomoTextStyle largeSubtitle = FomoTextStyle(
    color: FomoColor.onPrimaryVariant,
    fontSize: FomoFontSize.p1,
    fontWeight: FomoFontWeight.normal,
  );

  static final FomoTextStyle smallSubtitle = FomoTextStyle(
    color: FomoColor.onPrimaryVariant,
    fontSize: FomoFontSize.p2,
    fontWeight: FomoFontWeight.normal,
  );

  FomoTextStyle({FomoColor color, double fontSize, FontWeight fontWeight})
      : super(
          color: color,
          fontFamily: FomoFontFamily.global,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );
}
