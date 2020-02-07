import 'package:flutter/material.dart';

class FomoColor extends Color {
  static final FomoColor primary = FomoColor(0x01 << 24 | _base);
  static final FomoColor surface = FomoColor(0x10 << 24 | _base);
  static final FomoColor onPrimary = FomoColor(0xFF << 24 | _base);
  static final FomoColor onPrimaryVariant = FomoColor(0x99 << 24 | _base);

  static const int _base = 0x00FFFFFF;

  FomoColor(int color) : super(color);
}

class FomoGradient {
  static const LinearGradient main = LinearGradient(
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
