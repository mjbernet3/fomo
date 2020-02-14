import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/login_page.dart';
import 'package:project_fomo/frontend/pages/register_page.dart';
import 'package:project_fomo/frontend/pages/root_page.dart';
import 'package:project_fomo/frontend/pages/unknown_page.dart';
import 'package:project_fomo/frontend/pages/welcome_page.dart';
import 'package:provider/provider.dart';
import 'app_container.dart';


void main() => runApp(AppName());

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppContainer().providers,
      child: MaterialApp(
        initialRoute: WelcomePage.pageRoute,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF121212),
        ),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case WelcomePage.pageRoute:
                  return WelcomePage();
                case RegisterPage.pageRoute:
                  return RegisterPage();
                case LoginPage.pageRoute:
                  return LoginPage();
                case RootPage.pageRoute:
                  return RootPage();
                default:
                  return UnknownPage();
              }
            },
          );
        },
      ),
    );
  }
}
