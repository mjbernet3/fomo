import 'package:flutter/material.dart';
import 'package:project_fomo/app_builder.dart';
import 'package:project_fomo/backend/models/user.dart';
import 'package:project_fomo/backend/services/auth_service.dart';
import 'package:project_fomo/backend/state_models/button_row_model.dart';
import 'package:project_fomo/frontend/components/shared/loading_indicator.dart';
import 'package:project_fomo/frontend/pages/forgot_pass_page.dart';
import 'package:project_fomo/frontend/pages/login_page.dart';
import 'package:project_fomo/frontend/pages/register_page.dart';
import 'package:project_fomo/frontend/pages/root_page.dart';
import 'package:project_fomo/frontend/pages/unknown_page.dart';
import 'package:project_fomo/frontend/pages/welcome_page.dart';
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
        ChangeNotifierProvider<ButtonRowModel>.value(
          value: ButtonRowModel()
        )
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
