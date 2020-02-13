import 'package:flutter/material.dart';

class ViewAllPage extends StatelessWidget {
  static const String pageRoute = '/view-all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('View All'),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Color(0xCF40E0D0),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Go back',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
