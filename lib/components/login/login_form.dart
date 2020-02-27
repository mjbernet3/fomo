import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/gradient_button.dart';
import 'package:project_fomo/style.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              labelText: 'Enter your email',
            ),
            validator: (value) {
              //TODO: Implement login email validation
              return null;
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            autocorrect: false,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: 'Enter your password',
            ),
            validator: (value) {
              //TODO: Implement login password validation
              return null;
            },
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
            buttonPressed: () {
              if (_formKey.currentState.validate()) {
                print('Input validated and can now login');
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
