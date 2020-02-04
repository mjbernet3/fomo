import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/backend/state_models/login_model.dart';
import 'package:project_fomo/backend/services/AuthService.dart';
import 'package:project_fomo/frontend/components/inputFieldWidget.dart';

//TODO: Recreate login page UI
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;

    return ChangeNotifierProvider(
      create: (_) => LoginModel(
        authenticator: Provider.of<AuthService>(context),
      ),
      child: Consumer<LoginModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      loginPageHeader('Log In'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          inputField('Email or Username', Icons.person,
                                  (String input) { _email = input; }),
                          inputField('Password', Icons.lock,
                              (String input) { _password = input;}, true)
                        ]
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}


/*
Widget created using Paul's rules
 */
Widget loginPageHeader(String title) {
  return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
              SizedBox(
                height: 3.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFFFF6C1A),
                        Color(0xFFF01844),
                        Color(0xFF7E0BC9),
                      ],
                      stops: [
                        0.0,
                        .528,
                        1.0,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(),
        ),
      ],
  );
}