import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/login_bloc.dart';
import 'package:project_fomo/components/login/login_form.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/pages/forgot_pass_page.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const String pageRoute = '/login';

  @override
  Widget build(BuildContext context) {
    return Provider<LoginBloc>(
      create: (context) => LoginBloc(
        authService: Provider.of<AuthService>(
          context,
          listen: false,
        ),
      ),
      dispose: (context, bloc) => bloc.dispose(),
      child: Scaffold(
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
        body: Padding(
          padding: EdgeInsets.only(bottom: 40, left: 15, right: 15, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PageHeader('Log In'),
              SizedBox(height: 60),
              LoginForm(),
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
