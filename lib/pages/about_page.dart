import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const String pageRoute = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(),
    );
  }
}
