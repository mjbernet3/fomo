import 'package:flutter/material.dart';
import 'package:project_fomo/backend/services/auth_service.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static const String pageRoute = '/';

  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context);

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
          ],
        ),
      ),
    );
  }
}
