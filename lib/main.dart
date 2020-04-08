import 'package:flutter/material.dart';
import 'package:project_fomo/app_builder.dart';
import 'package:project_fomo/models/user.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/pages/forgot_pass_page.dart';
import 'package:project_fomo/pages/login_page.dart';
import 'package:project_fomo/pages/register_page.dart';
import 'package:project_fomo/pages/root_page.dart';
import 'package:project_fomo/pages/unknown_page.dart';
import 'package:project_fomo/pages/welcome_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppName());

class AppName extends StatelessWidget {
  Widget setHome(AsyncSnapshot<User> userSnapshot) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? RootPage() : WelcomePage();
    } else {
      return LoadingIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (context) => AuthService(),
        ),
      ],
      child: AppBuilder(
        builder: (context, userSnapshot) {
          return MaterialApp(
            home: setHome(userSnapshot),
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
                    case ForgotPassPage.pageRoute:
                      return ForgotPassPage();
                    case RootPage.pageRoute:
                      return RootPage();
                    default:
                      return UnknownPage();
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
