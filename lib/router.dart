import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/discover_page.dart';
import 'package:project_fomo/frontend/pages/login_page.dart';
import 'package:project_fomo/frontend/pages/register_page.dart';
import 'package:project_fomo/frontend/pages/welcome_page.dart';
import 'package:project_fomo/frontend/pages/unknown_page.dart';

/* This is the place to add routes for new pages */

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case WelcomePage.pageRoute:
      return MaterialPageRoute(builder: (context) => WelcomePage());
    case RegisterPage.pageRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case LoginPage.pageRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case DiscoverPage.pageRoute:
      return MaterialPageRoute(builder: (context) => DiscoverPage());
    default:
      return MaterialPageRoute(builder: (context) => UnknownPage());
  }
}
