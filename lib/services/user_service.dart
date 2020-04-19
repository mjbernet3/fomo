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

  Future<bool> addFriend(String userName) async {
    // Assumes the userName property of all users is unique
    UserData me = await this.userData.first;
    print(me);
    String myUserName = me.userName;
    if (me.friends.contains(userName)) {
      return false;
      // throw Exception('user ${myUserName} is already friends with ${userName}');
    }
    UserData friend;
    // Find target user
    await _userDataCollection
        .where('userName', isEqualTo: userName)
        .limit(1)
        .getDocuments()
        .then((QuerySnapshot friends) {
      if (friends.documents.length == 1) {
        // Add my userName to target user's friend list
        DocumentSnapshot doc = friends.documents[0];
        friend = UserData.fromDocSnap(doc);
        if (doc.data['friends'].contains(myUserName)) {
          return false;
//          throw Exception(
//              'user ${userName} is already friends with ${myUserName}');
        }
        List<dynamic> newFriends = doc.data['friends'];
        newFriends.add(myUserName);
        _userDataCollection
            .document(doc.documentID)
            .updateData({'friends': newFriends});
      } else {
        return false;
//        throw Exception(
//            'user with userName ${userName} not found.'); // Logically equivalent to next possible Exception. Consider keeping only one.
      }
      return true;
    });
    if (friend == null) {
      return false;
//      throw Exception(
//          'user with userName ${userName} not found.'); // Logically equivalent to previous possible Exception. Consider removing.
    }
    // Add target user to my friend list
    List<dynamic> newFriends = me.friends;
    newFriends.add(userName);
    await _userDataCollection
        .document(_userId)
        .updateData({'friends': newFriends});
    return true;
  }
}
