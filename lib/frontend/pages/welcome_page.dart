import 'package:flutter/material.dart';

//TODO: Recreate welcome page UI
class WelcomePage extends StatelessWidget {
  static const String pageRoute = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'F O M O',
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            RaisedButton(
              color: Color(0xCF40E0D0),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'Register',
              ),
            ),
            RaisedButton(
              color: Color(0xCF40E0D0),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
