import 'package:flutter/material.dart';
import 'package:project_fomo/components/profile/profile_header.dart';
import 'package:project_fomo/components/profile/settings_list.dart';
import 'package:project_fomo/style.dart';

class ProfilePage extends StatelessWidget {
  static const String pageRoute = '/profilepage';
  static const String displayName = 'Jack DiMarco';
  static const String email = 'emma.m.chadwick@gmail.com';
  static const String bio =
      'I like Atlanta noise. If you like Atlanta noise lets find Atlanta noise together.';
  static const String profileUrl =
      'https://twistedsifter.files.wordpress.com/2012/09/trippy-profile-pic-portrait-head-on-and-from-side-angle.jpg?w=800';
  static const String userName = 'jack';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProfileHeader(
              displayName: displayName,
              userName: userName,
              bio: bio,
              profileUrl: profileUrl,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: AppColor.gradient,
              ),
            ),
            SettingList(),
          ],
        ),
      ),
    );
  }
}
