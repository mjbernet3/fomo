import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/user.dart';
import 'package:project_fomo/frontend/pages/discover_page.dart';
import 'package:project_fomo/frontend/pages/welcome_page.dart';
import 'package:project_fomo/frontend/pages/login_page.dart';
import 'package:project_fomo/frontend/pages/register_page.dart';
import 'package:provider/provider.dart';
import 'app_container.dart';

void main() => runApp(AppName());

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppContainer().providers,
      child: MaterialApp(
        home: InitialPageSelector(),
        theme: ThemeData.dark(),
        routes: {
          '/welcome': (context) => WelcomePage(),
          '/register': (context) => RegisterPage(),
          '/login': (context) => LoginPage(),
          '/discover': (context) => DiscoverPage(),
        },
      ),
    );
  }
}

class InitialPageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);

    //return user != null ? DiscoverPage() : WelcomePage();
    return WelcomePage();
  }
}
