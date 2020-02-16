import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/shared/auth_page_header.dart';
import 'package:project_fomo/frontend/components/shared/loading_indicator.dart';
import 'package:project_fomo/frontend/pages/forgot_pass_page.dart';
import 'package:project_fomo/frontend/pages/root_page.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/frontend/components/shared/input_field.dart';
import 'package:project_fomo/frontend/components/shared/gradient_button.dart';
import 'package:project_fomo/backend/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  static const String pageRoute = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  AuthService _authService;

  @override
  Widget build(BuildContext context) {
    _authService = Provider.of<AuthService>(context);
    String _email;
    String _password;

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _isLoading
          ? LoadingIndicator()
          : SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: 40, left: 15, right: 15, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AuthPageHeader('Log In'),
                    SizedBox(height: 60),
                    InputField(
                      'Email or Username',
                      Icons.person,
                      (String input) {
                        _email = input;
                      },
                    ),
                    SizedBox(height: 30),
                    InputField(
                      'Password',
                      Icons.lock,
                      (String input) {
                        _password = input;
                      },
                      true,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GradientButton(
                      buttonText: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: AppFontSize.size22,
                          fontFamily: AppFontFamily.family,
                        ),
                      ),
                      buttonPressed: () async {
                        setState(() => _isLoading = true);
                        bool success = await _authService
                            .signInWithEmailAndPassword(_email, _password);
                        setState(() => _isLoading = false);
                        if (success) {
                          Navigator.pushNamed(context, RootPage.pageRoute);
                        }
                      },
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgotPassPage.pageRoute);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppTextColor.mediumEmphasis,
                          fontFamily: AppFontFamily.family,
                          fontSize: AppFontSize.size14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
