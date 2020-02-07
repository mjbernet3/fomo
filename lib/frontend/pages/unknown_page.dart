import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Incorrect route.',
          style: TextStyle(
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}
