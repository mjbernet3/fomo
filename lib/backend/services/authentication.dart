import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_fomo/backend/models/user.dart';

class Authentication {
  final _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_firebaseUser);
  }

  User _firebaseUser(FirebaseUser user) {
    if (user == null) {
      return null;
    }

    return User(
      uid: int.parse(user.uid),
      email: user.email,
    );
  }

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

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
