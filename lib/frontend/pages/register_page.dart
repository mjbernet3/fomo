import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/backend/state_models/register_model.dart';
import 'package:project_fomo/backend/services/AuthService.dart';
import 'package:project_fomo/frontend/components/GradientButton.dart';
import 'package:project_fomo/frontend/components/InputFieldWidget.dart';
import 'package:project_fomo/frontend/components/loginPageHeader.dart';

//TODO: Recreate register page UI
class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    String _name;
    String _username;


    InputField emailInput = InputField('Email Address', Icons.mail,
            (String input) { _email = input; });
    InputField nameInput = InputField('Name', Icons.person,
            (String input) { _name = input; });
    InputField usernameInput = InputField('Username', Icons.done,
            (String input) { _username = input; });
    InputField passwordInput = InputField('Password', Icons.lock,
            (String input) { _password = input; }, true);



    return ChangeNotifierProvider(
      create: (_) => RegisterModel(
        authenticator: Provider.of<AuthService>(context),
      ),
      child: Consumer<RegisterModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios,
                  color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(child: Padding(
            padding: EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 30),
            child: model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      loginPageHeader('Register'),
                      SizedBox(height: 60),
                      emailInput,
                      SizedBox(
                        height: 30.0,
                      ),
                      nameInput,
                      SizedBox(
                        height: 30.0,
                      ),
                      usernameInput,
                      SizedBox(
                        height: 30.0,
                      ),
                      passwordInput,
                      SizedBox(
                        height: 50.0,
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
          )
          ),
        ),
      ),
    );
  }
}
