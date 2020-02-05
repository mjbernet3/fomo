import 'package:flutter/material.dart';

class FomoFontSize {
  double _size;
  static const double _h1 = 36.0;
  static const double _h2 = 28.0;
  static const double _h3 = 22.0;
  static const double _p1 = 18.0;
  static const double _p2 = 16.0;
  static const double _p3 = 14.0;

  FomoFontSize(this._size);

  double get size => _size;
  static FomoFontSize get h1 => FomoFontSize(_h1);
  static FomoFontSize get h2 => FomoFontSize(_h2);
  static FomoFontSize get h3 => FomoFontSize(_h3);
  static FomoFontSize get p1 => FomoFontSize(_p1);
  static FomoFontSize get p2 => FomoFontSize(_p2);
  static FomoFontSize get p3 => FomoFontSize(_p3);
}

class FomoFontWeight {
  FontWeight _weight;
  static const _bold = FontWeight.w600;
  static const _normal = FontWeight.w400;

  FomoFontWeight(this._weight);

  FontWeight get weight => _weight;
  static FomoFontWeight get bold => FomoFontWeight(_bold);
  static FomoFontWeight get normal => FomoFontWeight(_normal);
}

class FomoColor {
  Color _color;
  static const int _background = 0x16;
  static const int _surface = 0x02;
  static const int _onPrimary = 0x00;
  static const int _onPrimaryVariant = 0x13;
  static const int _base = 0xFFFFFFFF;

  FomoColor(Color color) {
    this._color = color;
  }

  Color get color {
    return _color;
  }

  static FomoColor get background => FomoColor(Color(_background << 6 | _base));

  static FomoColor get surface => FomoColor(Color(_surface << 6 | _base));

  static FomoColor get onPrimary => FomoColor(Color(_onPrimary << 6 | _base));

  static FomoColor get onPrimaryVariant =>
      FomoColor(Color(_onPrimaryVariant << 6 | _base));
}

class FomoFontFamily {
  String _family;
  static const String _primary = "Raleway";

  FomoFontFamily(String family) {
    this._family = family;
  }

  String get family => _family;
  static FomoFontFamily get primary => FomoFontFamily(_primary);
}

class FomoTextStyle extends TextStyle {
  static final defaultStyle = FomoTextStyle(
    color: FomoColor.onPrimary,
    fontSize: FomoFontSize.p1,
    fontWeight: FomoFontWeight.bold,
    fontFamily: FomoFontFamily.primary,
  );

  FomoTextStyle(
      {FomoColor color,
      FomoFontSize fontSize,
      FomoFontWeight fontWeight,
      FomoFontFamily fontFamily})
      : super(
          color: color.color,
          fontSize: fontSize.size,
          fontWeight: fontWeight.weight,
          fontFamily: fontFamily.family,
        );
}

class FomoText extends Text {
  FomoText(String text, {@required FomoTextStyle style})
      : super(
          text,
          style: TextStyle(
              color: style.color,
              fontSize: style.fontSize,
              fontWeight: style.fontWeight,
              fontFamily: style.fontFamily),
        );
}
