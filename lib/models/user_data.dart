import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String userName;
  String displayName;
  String bio;
  String profileUrl;
  bool shouldLocate;
  bool shouldNotify;
  List interested;
  List going;
  List friends;

  UserData({
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

  factory UserData.initial(String userName, String name) {
    return UserData(
      userName: userName,
      displayName: name,
      bio: '',
      profileUrl:
          'https://twistedsifter.files.wordpress.com/2012/09/trippy-profile-pic-portrait-head-on-and-from-side-angle.jpg?w=800',
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
