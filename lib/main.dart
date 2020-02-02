import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/user.dart';
import 'package:project_fomo/frontend/pages/welcome_page.dart';
import 'package:project_fomo/router.dart' as router;
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
        theme: ThemeData.dark(),
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
