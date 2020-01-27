import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/discover_page.dart';

void main() => runApp(AppName());

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/discover',
      theme: ThemeData.dark(),
      routes: {
        '/discover': (context) => DiscoverPage(),
      },
    );
  }
}
