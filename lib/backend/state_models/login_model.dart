import 'package:project_fomo/backend/services/AuthService.dart';
import 'package:flutter/foundation.dart';

class LoginModel extends ChangeNotifier {
  AuthService _authenticator;
  bool _isLoading = false;

  LoginModel({AuthService authenticator}) {
    this._authenticator = authenticator;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool loadingState) {
    _isLoading = loadingState;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    isLoading = true;
    bool success =
        await _authenticator.signInWithEmailAndPassword(email, password);
    isLoading = false;
    return success;
  }
}
