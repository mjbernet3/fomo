import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_fomo/backend/models/user.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return result.user != null;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }
}
