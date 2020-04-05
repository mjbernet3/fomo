import 'package:flutter/material.dart';

class ButtonRowModel extends ChangeNotifier {
  int _buttonIndex = 0;

  int get buttonIndex => _buttonIndex;

  set buttonIndex(int val) {
    _buttonIndex = val;
    notifyListeners();
  }

  pressed(int val) {
    buttonIndex = val;
  }
}