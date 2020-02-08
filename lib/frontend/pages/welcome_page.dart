import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/gradient_button.dart';
import 'package:project_fomo/frontend/pages/login_page.dart';
import 'package:project_fomo/frontend/pages/register_page.dart';
import 'package:project_fomo/style.dart';

class WelcomePage extends StatelessWidget {
  static const String pageRoute = '/welcome';

  static const TextStyle subTextStyle = TextStyle(
    fontFamily: AppFontFamily.family,
    fontSize: AppFontSize.size16,
    color: AppTextColor.mediumEmphasis,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/welcome-background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 50, right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "lib/assets/images/MusicIcon.png",
                      height: 120,
                      width: 120,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'FOMO',
                      style: TextStyle(
                        fontFamily: AppFontFamily.family,
                        fontWeight: AppFontWeight.bold,
                        fontSize: 64,
                      ),
                    ),
                    SizedBox(height: 75),
                    Text(
                      'Bringing Atlanta together',
                      style: subTextStyle,
                    ),
                    Text(
                      'through NOISE',
                      style: subTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              GradientButton(
                buttonText: 'Log In',
                buttonPressed: () {
                  Navigator.pushNamed(context, LoginPage.pageRoute);
                },
              ),
              GradientButton(
                buttonText: 'Register',
                buttonPressed: () {
                  Navigator.pushNamed(context, RegisterPage.pageRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
