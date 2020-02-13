import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/root_page.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/backend/state_models/register_model.dart';
import 'package:project_fomo/frontend/components/gradient_button.dart';
import 'package:project_fomo/frontend/components/input_field.dart';
import 'package:project_fomo/frontend/components/login_page_header.dart';
import 'package:project_fomo/backend/services/auth_service.dart';

class RegisterPage extends StatelessWidget {
  static const String pageRoute = '/register';

  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    String _name;
    String _username;

    return ChangeNotifierProvider(
      create: (_) => RegisterModel(
        authenticator: Provider.of<AuthService>(context),
      ),
      child: Consumer<RegisterModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 30),
              child: model.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        loginPageHeader('Register'),
                        SizedBox(
                          height: 60,
                        ),
                        InputField(
                          'Email Address',
                          Icons.mail,
                          (String input) {
                            _email = input;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        InputField(
                          'Name',
                          Icons.person,
                          (String input) {
                            _name = input;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        InputField(
                          'Username',
                          Icons.done,
                          (String input) {
                            _username = input;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        InputField(
                          'Password',
                          Icons.lock,
                          (String input) {
                            _password = input;
                          },
                          true,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        GradientButton(
                          buttonText: 'Register',
                          buttonPressed: () async {
                            bool success =
                                await model.register(_email, _password);
                            if (success) {
                              Navigator.pushNamed(context, RootPage.pageRoute);
                            }
                          },
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
