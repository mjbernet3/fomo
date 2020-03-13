import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static const String pageRoute = '/';

  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(
      context,
      listen: false,
    );
    UserService userService = Provider.of<UserService>(
      context,
      listen: false,
    );

    return Scaffold(
      body: StreamBuilder(
        stream: userService.userData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingIndicator();
          }

          final UserData _userData = snapshot.data;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Profile for ${_userData.userName}'),
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
          );
        },
      ),
    );
  }
}
