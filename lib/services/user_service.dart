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

  Response updateNotification(bool data) {
    try {
      _userDataCollection
          .document(_userId)
          .updateData({'shouldNotify': data});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Response updateLocation(bool data) {
    try {
      _userDataCollection
          .document(_userId)
          .updateData({'shouldLocate': data});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }
}
