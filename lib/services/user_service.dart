import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_fomo/models/user.dart';
import 'package:project_fomo/utils/structures/response.dart';
import 'package:rxdart/rxdart.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userDataCollection =
      Firestore.instance.collection('users');

  static final _databaseReference = Firestore.instance;

  final String _userId;

  UserService (this._userId);

  Stream<UserData> get userData {
    return _userDataCollection
        .document(_userId)
        .snapshots()
        .map((DocumentSnapshot userDataSnap) {
      return UserData.fromDocSnap(userDataSnap);
    });
  }

  Stream<User> get signedInUser {
    return _auth.onAuthStateChanged.map((FirebaseUser firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }
      return User.fromFirebaseUser(firebaseUser);
    });
  }

  updateName(String name) {
    if (name != null) {
      try {
        _databaseReference
          .collection('users')
            .document(_userId)
            .updateData({'displayName': name});
        return Response(status: Status.SUCCESS);
      } catch (error) {
        return Response(status: Status.FAILURE, message: error.toString());
      }
    }
  }

  updateUsername(String username) {
    if (username != null) {
      try {
        _databaseReference
            .collection('users')
            .document(_userId)
            .updateData({'userName': username});
        return Response(status: Status.SUCCESS);
      } catch (error) {
        return Response(status: Status.FAILURE, message: error.toString());
      }
    }
  }
}
