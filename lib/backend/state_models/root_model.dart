import 'package:flutter/cupertino.dart';

class RootModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool loadingState) {
    _isLoading = loadingState;
    notifyListeners();
  }
}
