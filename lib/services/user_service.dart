import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/user_data.dart';

class UserService {
  final CollectionReference _userDataCollection =
      Firestore.instance.collection('users');

  final _databaseReference = Firestore.instance;

  final String _userId;

  UserService(this._userId);

  Stream<UserData> get userData {
    return _userDataCollection
        .document(_userId)
        .snapshots()
        .map((DocumentSnapshot userDataSnap) {
      return UserData.fromDocSnap(userDataSnap);
    });
  }

  updateName(String name) {
    if (name != null) {
      try {
        _databaseReference
          .collection('users')
            .document(_userId)
            .updateData({'displayName': name});
      } catch (e) {
        print(e.toString());
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
      } catch (e) {
        print(e.toString());
      }
    }
  }

}
