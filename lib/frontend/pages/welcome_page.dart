import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/gradient_button.dart';

class WelcomePage extends StatelessWidget {
  static const String pageRoute = '/welcome';

  final TextStyle titleStyle = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 64,
  );

  final TextStyle subTextStyle =
      TextStyle(fontFamily: 'Raleway', fontSize: 16, color: Color(0xFF939393));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "lib/frontend/assets/images/welcome-background.jpeg"),
                fit: BoxFit.cover)),
        child: Padding(
            padding: EdgeInsets.only(bottom: 50, right: 15, left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Column(children: <Widget>[
                    new Image.asset(
                      "lib/frontend/assets/images/MusicIcon.png",
                      height: 120,
                      width: 120,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'FOMO',
                      style: titleStyle,
                    ),
                    SizedBox(height: 75),
                    Text('Bringing Atlanta together', style: subTextStyle),
                    Text(
                      'through NOISE',
                      style: subTextStyle,
                    )
                  ]),
                ),
                SizedBox(height: 50),
                GradientButton(
                  buttonText: 'Log In',
                  buttonPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                GradientButton(
                    buttonText: 'Register',
                    buttonPressed: () {
                      Navigator.pushNamed(context, '/register');
                    }),
              ],
            )),
      ),
    );
  }
}
