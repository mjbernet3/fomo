import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/login_bloc.dart';
import 'package:project_fomo/components/shared/gradient_button.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/pages/forgot_pass_page.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

const UnderlineInputBorder inputUnderline = UnderlineInputBorder(
  borderSide: const BorderSide(
    color: AppColor.dp24,
    width: 2,
  ),
);

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        StreamBuilder(
                          stream: _bloc.validatedEmail,
                          builder: (context, snapshot) {
                            return TextField(
                              onChanged: (value) => _bloc.changeEmail(value),
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: AppTextColor.mediumEmphasis,
                              autocorrect: false,
                              decoration: InputDecoration(
                                alignLabelWithHint: false,
                                focusedBorder: inputUnderline,
                                enabledBorder: inputUnderline,
                                icon: Icon(
                                  Icons.email,
                                  color: AppColor.dp24,
                                ),
                                labelText: 'Enter your email',
                                labelStyle: TextStyle(
                                  color: AppTextColor.mediumEmphasis,
                                ),
                                errorText: snapshot.error,
                                errorStyle: TextStyle(
                                  color: AppTextColor.highEmphasis,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        StreamBuilder(
                          stream: _bloc.validatedPassword,
                          builder: (context, snapshot) {
                            return TextField(
                              onChanged: (value) => _bloc.changePassword(value),
                              obscureText: true,
                              autocorrect: false,
                              decoration: InputDecoration(
                                alignLabelWithHint: false,
                                focusedBorder: inputUnderline,
                                enabledBorder: inputUnderline,
                                icon: Icon(
                                  Icons.lock,
                                  color: AppColor.dp24,
                                ),
                                labelText: 'Enter your password',
                                labelStyle: TextStyle(
                                  color: AppTextColor.mediumEmphasis,
                                ),
                                errorText: snapshot.error,
                                errorStyle: TextStyle(
                                  color: AppTextColor.highEmphasis,
                                ),
                              ),
                            );
                          },
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
                            bool success = await _bloc.login();
                            if (!success) {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Failed to login: Make sure email and password are correct.",
                                    style: TextStyle(
                                      color: AppTextColor.title,
                                      fontFamily: AppFontFamily.family,
                                    ),
                                  ),
                                  backgroundColor: AppColor.dp4,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                            _bloc.changeLoading(false);
                          },
                        ),
                      ],
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
              );
      },
    );
  }
}
