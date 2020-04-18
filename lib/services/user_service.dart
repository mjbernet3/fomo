import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/user_data.dart';

class UserService {
  final CollectionReference _userDataCollection =
      Firestore.instance.collection('users');

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

  Stream<UserData> otherUserData(String id) {
    return _userDataCollection
        .document(id)
        .snapshots()
        .map((DocumentSnapshot userDataSnap) {
      return UserData.fromDocSnap(userDataSnap);
    });
  }
}
