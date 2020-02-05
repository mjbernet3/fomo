import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/discover_page.dart';
import 'package:project_fomo/frontend/pages/unknown_page.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: DiscoverPage.pageRoute,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case DiscoverPage.pageRoute:
                return DiscoverPage();
              default:
                return UnknownPage();
            }
          },
        );
      },
    );
  }
}
