import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/auth_bloc.dart';
import 'package:project_fomo/components/shared/gradient_button.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

const UnderlineInputBorder inputUnderline = UnderlineInputBorder(
  borderSide: const BorderSide(
    color: AppColor.dp24,
    width: 2,
  ),
);

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  AuthBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<AuthBloc>(context);
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
                    EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    PageHeader('Register'),
                    SizedBox(
                      height: 60,
                    ),
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
                        'Register',
                        style: TextStyle(
                          fontSize: AppFontSize.size22,
                          fontFamily: AppFontFamily.family,
                        ),
                      ),
                      buttonPressed: () async {
                        _bloc.changeLoading(true);
                        bool success = await _bloc.register();
                        if (!success) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Failed to register: Please use valid credentials.",
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
              );
      },
    );
  }
}
