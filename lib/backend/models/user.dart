import 'package:flutter/foundation.dart';

class User {
  String uid;
  String email;
  String displayName;
  String photoUrl;

  User(
      {@required this.uid,
      @required this.email,
      this.displayName,
      this.photoUrl});
}
