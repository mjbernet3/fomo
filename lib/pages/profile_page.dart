import 'package:flutter/material.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static const String pageRoute = '/';

  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context);
    UserService userService = Provider.of<UserService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            RaisedButton(
              color: Color(0xCF40E0D0),
              onPressed: () {
                userService.getUserData().then((value) => print(value));
              },
              child: Text(
                'Print user data',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
