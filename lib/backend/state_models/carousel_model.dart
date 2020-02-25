import 'package:flutter/material.dart';

class CarouselModel extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  set index(int index) {
    this._index = index;
    notifyListeners();
  }
}
