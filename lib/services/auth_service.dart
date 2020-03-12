import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_fomo/models/user.dart';
import 'package:project_fomo/models/user_data.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userDataCollection =
      Firestore.instance.collection('users');

  Stream<User> get signedInUser {
    return _auth.onAuthStateChanged.map((FirebaseUser firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }

      return User.fromFirebaseUser(firebaseUser);
    });
  }

  Future<bool> registerWithEmailAndPassword(
      String email, String password, String userName, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        UserData userData = UserData.initial(userName, name);

        await _userDataCollection
            .document(result.user.uid)
            .setData(userData.toMap());
        return true;
      }

      return false;
    } catch (error) {
      print(error.toString());
      return false;
    }
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

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }
}
