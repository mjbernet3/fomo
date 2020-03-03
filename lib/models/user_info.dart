class UserInfo {
  String uid;
  String userName;
  String displayName;
  String bio;
  String profileUrl;
  bool shouldLocate;
  bool shouldNotify;
  List interested;
  List going;
  List friends;

  UserInfo({
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
}
