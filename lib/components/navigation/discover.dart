import 'package:flutter/material.dart';
import 'package:project_fomo/pages/discover_page.dart';
import 'package:project_fomo/pages/unknown_page.dart';
import 'package:project_fomo/pages/view_all_page.dart';
import 'package:project_fomo/pages/event_page.dart';

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
              case ViewAllPage.pageRoute:
                return ViewAllPage();
              case EventPage.pageRoute:
                return EventPage();
              default:
                return UnknownPage();
            }
          },
        );
      },
    );
  }
}
