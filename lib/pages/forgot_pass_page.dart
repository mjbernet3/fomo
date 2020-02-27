import 'package:flutter/material.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/components/shared/gradient_button.dart';
import 'package:project_fomo/components/shared/input_field.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class ForgotPassPage extends StatelessWidget {
  static const String pageRoute = '/forgot-pass';

  @override
  Widget build(BuildContext context) {
    String _email;
    AuthService authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0.0,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputField(
                'What is your email?',
                Icons.email,
                (String input) {
                  _email = input;
                },
              ),
              GradientButton(
                buttonText: Text(
                  'Send Reset Email',
                  style: TextStyle(
                    fontSize: AppFontSize.size16,
                  ),
                ),
                buttonPressed: () {
                  authService.sendPasswordResetEmail(_email);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
