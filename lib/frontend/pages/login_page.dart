import 'package:flutter/material.dart';
import 'package:project_fomo/backend/services/auth_service.dart';
import 'package:project_fomo/frontend/components/shared/auth_page_header.dart';
import 'package:project_fomo/frontend/components/shared/loading_indicator.dart';
import 'package:project_fomo/frontend/components/state_widget.dart';
import 'package:project_fomo/frontend/pages/forgot_pass_page.dart';
import 'package:project_fomo/frontend/pages/root_page.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/backend/state_models/login_model.dart';
import 'package:project_fomo/frontend/components/shared/input_field.dart';
import 'package:project_fomo/frontend/components/shared/gradient_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const String pageRoute = '/login';

  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;

    return StateWidget(
      stateModel: LoginModel(
        authenticator: Provider.of<AuthService>(context),
      ),
      builder: (context, model, child) => Scaffold(
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
        body: model.isLoading
            ? LoadingIndicator()
            : Padding(
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
                        bool success = await model.login(_email, _password);
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
