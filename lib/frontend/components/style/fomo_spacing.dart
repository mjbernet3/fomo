import 'package:flutter/material.dart';

const double _unitSpacing = 5.0;

class FomoSeparator extends SizedBox {
  static final Map<int, FomoSeparator> verticalSeparator = {
    0: FomoSeparator(width: _unitSpacing * 0.5),
    1: FomoSeparator(width: _unitSpacing),
    2: FomoSeparator(width: _unitSpacing * 2),
    3: FomoSeparator(width: _unitSpacing * 3),
  };

  static final Map<int, FomoSeparator> horizontalSeparator = {
    0: FomoSeparator(height: _unitSpacing * 0.5),
    1: FomoSeparator(height: _unitSpacing),
    2: FomoSeparator(height: _unitSpacing * 2),
    3: FomoSeparator(height: _unitSpacing * 3),
  };

  FomoSeparator({double width, double height})
      : super(width: width, height: height);
}

class FomoEdgeInsets {
  static final Map<int, EdgeInsets> left = {
    0: EdgeInsets.only(left: _unitSpacing * 0.5),
    1: EdgeInsets.only(left: _unitSpacing),
    2: EdgeInsets.only(left: _unitSpacing * 2),
    3: EdgeInsets.only(left: _unitSpacing * 3),
  };

  static final Map<int, EdgeInsets> right = {
    0: EdgeInsets.only(right: _unitSpacing * 0.5),
    1: EdgeInsets.only(right: _unitSpacing),
    2: EdgeInsets.only(right: _unitSpacing * 2),
    3: EdgeInsets.only(right: _unitSpacing * 3),
  };

  static final Map<int, EdgeInsets> all = {
    0: EdgeInsets.all(_unitSpacing * 0.5),
    1: EdgeInsets.all(_unitSpacing),
    2: EdgeInsets.all(_unitSpacing * 2),
    3: EdgeInsets.all(_unitSpacing * 3),
  };
}

class FomoSpacer {
  static final Map<int, double> unit = {
    0: _unitSpacing * 0.5,
    1: _unitSpacing,
    2: _unitSpacing * 2,
    3: _unitSpacing * 3,
  };
}
