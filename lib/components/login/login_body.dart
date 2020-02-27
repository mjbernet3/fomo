import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/login_bloc.dart';
import 'package:project_fomo/components/login/login_form.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/pages/forgot_pass_page.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  LoginBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<LoginBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.loading,
        initialData: false,
        builder: (context, snapshot) {
          return snapshot.data == true
              ? LoadingIndicator()
              : Padding(
                  padding:
                      EdgeInsets.only(bottom: 40, left: 15, right: 15, top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      PageHeader('Log In'),
                      SizedBox(height: 60),
                      LoginForm(),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ForgotPassPage.pageRoute);
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
                );
        });
  }
}
