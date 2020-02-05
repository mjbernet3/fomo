import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/discover_page.dart';
import 'package:project_fomo/frontend/pages/friends_page.dart';
import 'package:project_fomo/frontend/pages/login_page.dart';
import 'package:project_fomo/frontend/pages/my_events_page.dart';
import 'package:project_fomo/frontend/pages/profile_page.dart';
import 'package:project_fomo/frontend/pages/register_page.dart';
import 'package:project_fomo/frontend/pages/root_page.dart';
import 'package:project_fomo/frontend/pages/search_page.dart';
import 'package:project_fomo/frontend/pages/welcome_page.dart';
import 'package:project_fomo/frontend/pages/unknown_page.dart';

class Router {
  /* All new routes should be added here */

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DiscoverPage.pageRoute:
        return MaterialPageRoute(builder: (context) => DiscoverPage());
      case SearchPage.pageRoute:
        return MaterialPageRoute(builder: (context) => SearchPage());
      case FriendsPage.pageRoute:
        return MaterialPageRoute(builder: (context) => FriendsPage());
      case MyEventsPage.pageRoute:
        return MaterialPageRoute(builder: (context) => MyEventsPage());
      case ProfilePage.pageRoute:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      default:
        return MaterialPageRoute(builder: (context) => UnknownPage());
    }
  }

  /* Do not add any more routes here */

  static Route<dynamic> generateMainRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomePage.pageRoute:
        return MaterialPageRoute(builder: (context) => WelcomePage());
      case RegisterPage.pageRoute:
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case LoginPage.pageRoute:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case RootPage.pageRoute:
        return MaterialPageRoute(builder: (context) => RootPage());
      default:
        return MaterialPageRoute(builder: (context) => UnknownPage());
    }
  }
}
