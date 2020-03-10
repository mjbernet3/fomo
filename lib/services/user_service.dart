import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/user_data.dart';

class UserService {
  final CollectionReference _userDataCollection =
      Firestore.instance.collection('users');

  final String _userId;

  UserService(this._userId);

  Future<UserData> getUserData() async {
    try {
      QuerySnapshot userDataQuery = await _userDataCollection
          .where("uid", isEqualTo: _userId)
          .getDocuments();

      /*
          If there was more than one document returned then there is more than
          just the logged in users information
       */
      if (userDataQuery.documents.length > 1) {
        return null;
      }

      DocumentSnapshot userDataSnapshot = userDataQuery.documents[0];
      return UserData.fromDocSnap(userDataSnapshot);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
