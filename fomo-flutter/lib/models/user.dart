import 'package:firebase_auth/firebase_auth.dart';

class User {
  String uid;
  String email;

  User({this.uid, this.email});

  factory User.fromFirebaseUser(FirebaseUser firebaseUser) {
    return User(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
    );
  }
}
