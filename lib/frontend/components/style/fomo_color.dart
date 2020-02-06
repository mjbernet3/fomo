import 'package:flutter/material.dart';

class FomoColor extends Color {
  static final FomoColor background = FomoColor(0x01 << 24 | _base);
  static final FomoColor surface = FomoColor(0x10 << 24 | _base);
  static final FomoColor onPrimary = FomoColor(0xFF << 24 | _base);
  static final FomoColor onPrimaryVariant = FomoColor(0x99 << 24 | _base);

  static const int _base = 0x00FFFFFF;

  FomoColor(int color) : super(color);
}
