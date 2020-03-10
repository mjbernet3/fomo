import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String uid;
  String userName;
  String displayName;
  String bio;
  String profileUrl;
  bool shouldLocate;
  bool shouldNotify;
  List<String> interested;
  List<String> going;
  List<String> friends;

  UserData({
    this.uid,
    this.userName,
    this.displayName,
    this.bio,
    this.profileUrl,
    this.shouldLocate,
    this.shouldNotify,
    this.interested,
    this.going,
    this.friends,
  });

  factory UserData.initial(String uid, String userName, String name) {
    return UserData(
      uid: uid,
      userName: userName,
      displayName: name,
      bio: '',
      profileUrl: '', //TODO: Change to default profile URL when we have one
      shouldLocate: false,
      shouldNotify: false,
      interested: [],
      going: [],
      friends: [],
    );
  }

  factory UserData.fromDocSnap(DocumentSnapshot doc) {
    return UserData(
      uid: doc['uid'],
      userName: doc['userName'],
      displayName: doc['displayName'],
      bio: doc['bio'],
      profileUrl: doc['profileUrl'],
      shouldLocate: doc['shouldLocate'],
      shouldNotify: doc['shouldNotify'],
      interested: doc['interested'],
      going: doc['going'],
      friends: doc['friends'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName': userName,
      'displayName': displayName,
      'bio': bio,
      'profileUrl': profileUrl,
      'shouldLocate': shouldLocate,
      'shouldNotify': shouldNotify,
      'interested': interested,
      'going': going,
      'friends': friends,
    };
  }
}
