import 'package:flutter/material.dart';
import 'package:project_fomo/pages/my_events_page.dart';
import 'package:project_fomo/pages/unknown_page.dart';
import 'package:project_fomo/pages/event_clicked_page.dart';

import '../../pages/event_clicked_page.dart';

class MyEvents extends StatefulWidget {
  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: MyEventsPage.pageRoute,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case MyEventsPage.pageRoute:
                return MyEventsPage();
              case EventClickedPage.pageRoute:
                return EventClickedPage();
              default:
                return UnknownPage();
            }
          },
        );
      },
    );
  }
}
