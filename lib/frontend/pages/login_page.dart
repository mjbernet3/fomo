import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/backend/state_models/login_model.dart';
import 'package:project_fomo/backend/services/AuthService.dart';

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
            title: Text('Login'),
          ),
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        autofocus: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        onChanged: (String typedValue) {
                          _email = typedValue;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        onChanged: (String typedValue) {
                          _password = typedValue;
                        },
                      ),
                      RaisedButton(
                        color: Color(0xCF40E0D0),
                        onPressed: () async {
                          var success = await model.login(_email, _password);
                          if (success) {
                            Navigator.pushNamed(context, '/discover');
                          }
                        },
                        child: Text(
                          'Login',
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
