import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'You shouldn\'t be here',
          style: TextStyle(
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}
