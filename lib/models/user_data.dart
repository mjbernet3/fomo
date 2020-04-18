import 'package:cloud_firestore/cloud_firestore.dart';

// TODO: Change to storing event/user ids instead of full objects to save space
class UserData {
  String userName;
  String displayName;
  String profileUrl;
  bool shouldLocate;
  bool shouldNotify;
  List interested;
  List going;
  List friends;

  UserData({
    this.userName,
    this.displayName,
    this.profileUrl,
    this.shouldLocate,
    this.shouldNotify,
    this.interested,
    this.going,
    this.friends,
  });

  factory UserData.initial(String userName, String name) {
    return UserData(
      userName: userName,
      displayName: name,
      profileUrl:
          'http://www.eurogeosurveys.org/wp-content/uploads/2014/02/default_profile_pic.jpg',
      shouldLocate: false,
      shouldNotify: false,
      interested: [],
      going: [],
      friends: [],
    );
  }

  factory UserData.fromDocSnap(DocumentSnapshot doc) {
    return UserData(
      userName: doc['userName'],
      displayName: doc['displayName'],
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
      'userName': userName,
      'displayName': displayName,
      'profileUrl': profileUrl,
      'shouldLocate': shouldLocate,
      'shouldNotify': shouldNotify,
      'interested': interested,
      'going': going,
      'friends': friends,
    };
  }
}
