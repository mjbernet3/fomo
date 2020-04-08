import 'package:flutter/material.dart';
import 'package:project_fomo/pages/friends_page.dart';
import 'package:project_fomo/pages/unknown_page.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: FriendsPage.pageRoute,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case FriendsPage.pageRoute:
                return FriendsPage();
              default:
                return UnknownPage();
            }
          },
        );
      },
    );
  }
}
