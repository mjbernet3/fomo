import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_fomo/backend/models/user.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Stream<User> get signedInUser {
    return _auth.onAuthStateChanged.map((FirebaseUser firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }

      return User(
        uid: firebaseUser.uid,
        email: firebaseUser.email,
        displayName: firebaseUser.displayName,
        photoUrl: firebaseUser.photoUrl,
      );
    });
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
}
