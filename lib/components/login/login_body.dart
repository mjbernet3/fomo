import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/auth_bloc.dart';
import 'package:project_fomo/components/shared/gradient_button.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/components/shared/valid_input_field.dart';
import 'package:project_fomo/pages/forgot_pass_page.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/utils/structures/response.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  AuthBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<AuthBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40, left: 15, right: 15, top: 30),
      child: ListView(
        children: <Widget>[
          PageHeader('Log In'),
          SizedBox(height: 40),
          ValidInputField(
            inputStream: _bloc.validatedEmail,
            hintText: 'Email Address',
            icon: Icons.email,
            onChanged: (value) => _bloc.changeEmail(value),
          ),
          SizedBox(
            height: 30,
          ),
          ValidInputField(
            inputStream: _bloc.validatedPassword,
            hintText: 'Password',
            icon: Icons.lock,
            onChanged: (value) => _bloc.changePassword(value),
            isHidden: true,
          ),
          SizedBox(
            height: 30,
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
              _bloc.changeLoading(true);
              Response response = await _bloc.login();
              if (response.status == Status.FAILURE) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Failed to login: ${response.message}',
                      style: TextStyle(
                        color: AppTextColor.title,
                        fontFamily: AppFontFamily.family,
                      ),
                    ),
                    backgroundColor: AppColor.dp4,
                    duration: Duration(seconds: 2),
                  ),
                );

                _bloc.changeLoading(false);
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
          StreamBuilder(
            stream: _bloc.loading,
            initialData: false,
            builder: (context, snapshot) {
              return snapshot.data == true ? LoadingIndicator() : Container();
            },
          ),
        ],
      ),
    );
  }
}
