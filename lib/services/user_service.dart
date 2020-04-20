import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/utils/structures/response.dart';

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

  Future<Response> updateName(String name) async {
    try {
      await _userDataCollection
          .document(_userId)
          .updateData({'displayName': name});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> updateLocation(bool data) async {
    try {
      await _userDataCollection
          .document(_userId)
          .updateData({'shouldLocate': data});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> updateNotification(bool data) async {
    try {
      await _userDataCollection
          .document(_userId)
          .updateData({'shouldNotify': data});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> updateUsername(String username) async {
    try {
      await _userDataCollection
          .document(_userId)
          .updateData({'userName': username});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }
}
