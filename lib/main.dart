import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/discover_page.dart';
import 'package:project_fomo/frontend/pages/welcome_page.dart';
import 'package:project_fomo/frontend/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'app_container.dart';

void main() => runApp(AppName());

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppContainer().providers,
      child: MaterialApp(
        initialRoute: '/',
        theme: ThemeData.dark(),
        routes: {
          '/': (context) => WelcomePage(),
          '/login': (context) => LoginPage(),
          '/discover': (context) => DiscoverPage(),
        },
      ),
    );
  }
}
