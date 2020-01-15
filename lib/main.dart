import 'package:flutter/material.dart';

void main() => runApp(AppName());

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => Scaffold(),
      },
    );
  }
}
