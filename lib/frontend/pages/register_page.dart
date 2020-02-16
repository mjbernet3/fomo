import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/shared/auth_page_header.dart';
import 'package:project_fomo/frontend/components/shared/loading_indicator.dart';
import 'package:project_fomo/frontend/pages/root_page.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/frontend/components/shared/gradient_button.dart';
import 'package:project_fomo/frontend/components/shared/input_field.dart';
import 'package:project_fomo/backend/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  static const String pageRoute = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  AuthService _authService;

  @override
  Widget build(BuildContext context) {
    _authService = Provider.of<AuthService>(context);
    String _email;
    String _password;
    String _name;
    String _username;

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
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
                    EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AuthPageHeader('Register'),
                    SizedBox(
                      height: 60,
                    ),
                    InputField(
                      'Email Address',
                      Icons.mail,
                      (String input) {
                        _email = input;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    InputField(
                      'Name',
                      Icons.person,
                      (String input) {
                        _name = input;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    InputField(
                      'Username',
                      Icons.done,
                      (String input) {
                        _username = input;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    InputField(
                      'Password',
                      Icons.lock,
                      (String input) {
                        _password = input;
                      },
                      true,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    GradientButton(
                      buttonText: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: AppFontSize.size22,
                          fontFamily: AppFontFamily.family,
                        ),
                      ),
                      buttonPressed: () async {
                        setState(() => _isLoading = true);
                        bool success = await _authService
                            .registerWithEmailAndPassword(_email, _password);
                        setState(() => _isLoading = false);
                        if (success) {
                          Navigator.pushNamed(context, RootPage.pageRoute);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
