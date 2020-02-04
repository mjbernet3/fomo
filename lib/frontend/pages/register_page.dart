import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/backend/state_models/register_model.dart';
import 'package:project_fomo/backend/services/AuthService.dart';
import 'package:project_fomo/frontend/components/GradientButton.dart';

//TODO: Recreate register page UI
class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;

    return ChangeNotifierProvider(
      create: (_) => RegisterModel(
        authenticator: Provider.of<AuthService>(context),
      ),
      child: Consumer<RegisterModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Register'),
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
                      GradientButton(
                        buttonText: 'Register',
                        buttonPressed: () async {
                        bool success =
                          await model.register(_email, _password);
                          if (success) {
                            Navigator.pushNamed(context, '/discover');
                          }
                        },
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
