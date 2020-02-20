import 'package:project_fomo/backend/services/auth_service.dart';
import 'package:project_fomo/backend/state_models/root_model.dart';

class LoginModel extends RootModel {
  AuthService _authenticator;

  LoginModel({AuthService authenticator}) {
    this._authenticator = authenticator;
  }

  Future<bool> login(String email, String password) async {
    isLoading = true;
    bool success =
        await _authenticator.signInWithEmailAndPassword(email, password);
    isLoading = false;
    return success;
  }
}
