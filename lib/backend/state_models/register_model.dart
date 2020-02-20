import 'package:project_fomo/backend/services/auth_service.dart';
import 'package:project_fomo/backend/state_models/root_model.dart';

class RegisterModel extends RootModel {
  AuthService _authenticator;

  RegisterModel({AuthService authenticator}) {
    this._authenticator = authenticator;
  }

  Future<bool> register(String email, String password) async {
    isLoading = true;
    bool success =
        await _authenticator.registerWithEmailAndPassword(email, password);
    isLoading = false;
    return success;
  }
}
