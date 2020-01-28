import 'package:project_fomo/backend/services/authentication.dart';
import 'package:flutter/foundation.dart';

class LoginModel extends ChangeNotifier {
  Authentication _authenticator;
  bool _isLoading = false;

  LoginModel({Authentication authenticator}) {
    this._authenticator = authenticator;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool loadingState) {
    _isLoading = loadingState;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    print(email);
    print(password);
    isLoading = true;
    bool success =
        await _authenticator.signInWithEmailAndPassword(email, password);
    isLoading = false;
    return success;
  }
}
