import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/search_page.dart';
import 'package:project_fomo/frontend/pages/unknown_page.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: SearchPage.pageRoute,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case SearchPage.pageRoute:
                return SearchPage();
              default:
                return UnknownPage();
            }
          },
        );
      },
    );
  }
}
