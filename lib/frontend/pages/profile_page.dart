import 'package:flutter/material.dart';
import 'package:project_fomo/backend/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/frontend/components/shared/gradient_icon.dart';
import 'package:project_fomo/frontend/components/profile/profile_header.dart';

class ProfilePage extends StatelessWidget {
  static const String pageRoute = '/profilepage';
  static const String name = 'Emma Chadwick';
  static const String email = 'emma.m.chadwick@gmail.com';
  static const String bio = 'Tbh we should create a concert of all my songs of Lulu';
  static const String profileUrl = 'https://twistedsifter.files.wordpress.com/2012/09/trippy-profile-pic-portrait-head-on-and-from-side-angle.jpg?w=800';
  static const String tag = 'emchaddy';



  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProfileHeader(name: name, tag: tag, bio: bio, profileUrl: profileUrl,),
            GradientIcon(icon: Icons.location_on),
            Text('Profile'),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Color(0xCF40E0D0),
              onPressed: () {
                authService.signOut();
              },
              child: Text(
                'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
