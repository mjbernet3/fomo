import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/profile_page.dart';
import 'package:project_fomo/frontend/pages/unknown_page.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: ProfilePage.pageRoute,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case ProfilePage.pageRoute:
                return ProfilePage();
              default:
                return UnknownPage();
            }
          },
        );
      },
    );
  }
}
