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

  // Security flaw, exposes id of user
  Future<UserData> _getUserDataFromUserName(String userName) async {
    try {
      return _userDataCollection
          .where('userName', isEqualTo: userName)
          .limit(1)
          .getDocuments()
          .then((QuerySnapshot qs) {
        if (qs.documents.length == 0) {
          throw Future.error('failed to find user $userName');
        }
        return UserData.fromDocSnap(qs.documents[0]);
      });
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<void> _setFriendsOfUser(
      String userName, List<dynamic> newFriends) async {
    return _userDataCollection
        .where('userName', isEqualTo: userName)
        .limit(1)
        .getDocuments()
        .then((QuerySnapshot qs) {
      if (qs.documents.length == 0) {
        throw Future.error('failed to find user $userName');
      }
      qs.documents.forEach((DocumentSnapshot ds) {
        _userDataCollection
            .document(ds.documentID)
            .updateData({'friends': newFriends});
      });
    });
  }

  Future<void> _setFriends(List<dynamic> newFriends) {
    return _userDataCollection
        .document(_userId)
        .updateData({'friends': newFriends});
  }

  Future<void> addFriend(String userName) async {
    // Assumes the userName property of all users is unique
    try {
      UserData me = await this.userData.first;
      String myUserName = me.userName;
      if (me.friends.contains(userName)) {
        return Future.error(
            'user $myUserName is already friends with $userName');
      }
      UserData friendData = await _getUserDataFromUserName(userName);
      if (friendData.friends.contains(myUserName)) {
        return Future.error(
            'user $userName is already friends with $myUserName');
      }
      List<dynamic> targetNewFriends = friendData.friends;
      targetNewFriends.add(myUserName);
      await _setFriendsOfUser(userName, targetNewFriends);

      // Add target user to my friend list
      List<dynamic> myNewFriends = me.friends;
      myNewFriends.add(userName);
      await _setFriends(myNewFriends);
    } catch (error) {
      return Future.error(error);
    }
  }
}
