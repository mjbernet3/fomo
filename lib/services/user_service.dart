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

  Future<void> addFriend(String userName) async {
    // Assumes the userName property of all users is unique
    UserData me = await this.userData.last;
    String myUserName = me.userName;
    if (me.friends.contains(userName)) {
      throw Exception('user ${myUserName} is already friends with ${userName}');
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
          throw Exception(
              'user ${userName} is already friends with ${myUserName}');
        }
        List<String> newFriends = doc.data['friends'];
        newFriends.add(myUserName);
        _userDataCollection
            .document(doc.reference.path)
            .updateData({'friends': newFriends});
      } else {
        throw Exception(
            'user with userName ${userName} not found.'); // Logically equivalent to next possible Exception. Consider keeping only one.
      }
    });
    if (friend == null) {
      throw Exception(
          'user with userName ${userName} not found.'); // Logically equivalent to previous possible Exception. Consider removing.
    }
    // Add target user to my friend list
    List<String> newFriends = me.friends;
    newFriends.add(userName);
    await _userDataCollection
        .document(_userId)
        .updateData({'friends': newFriends});
  }
}
