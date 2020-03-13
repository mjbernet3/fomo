import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_fomo/models/user.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/utils/response.dart';

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

  Future<Response> registerWithEmailAndPassword(
      String email, String password, String userName, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        UserData userData = UserData.initial(userName, name);

        await _userDataCollection
            .document(result.user.uid)
            .setData(userData.toMap());

        return Response(status: Status.SUCCESS);
      }

      return Response(
          status: Status.FAILURE, message: "User null after creation.");
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        return Response(status: Status.SUCCESS);
      }

      return Response(
          status: Status.FAILURE, message: "User null after sign in.");
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> signOut() async {
    try {
      await _auth.signOut();

      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }
}
