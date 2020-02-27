import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/login_bloc.dart';
import 'package:project_fomo/components/shared/gradient_button.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc _bloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<LoginBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          StreamBuilder(
              stream: _bloc.validatedEmail,
              builder: (context, snapshot) {
                return TextField(
                  onChanged: (value) => _bloc.changeEmail(value),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Enter your email',
                    errorText: snapshot.error,
                  ),
                );
              }),
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
                    icon: Icon(Icons.lock),
                    labelText: 'Enter your password',
                    errorText: snapshot.error,
                  ),
                );
              }),
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
            buttonPressed: () {
              signIn();
            },
          ),
        ],
      ),
    );
  }

  Future<void> signIn() async {
    _bloc.changeLoading(true);
    bool success = await _bloc.login();
    if (!success) {
      print('Something went wrong while trying to login');
    }
    _bloc.changeLoading(false);
  }
}
