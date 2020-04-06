import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/pages/forgot_pass_page.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_fomo/models/user.dart';
import 'package:project_fomo/models/user_data.dart';

class AccountBody extends StatefulWidget {
  @override
  _AccountBodyState createState() => _AccountBodyState();
}


class _AccountBodyState extends State<AccountBody> {
  static String pageRoute = '/account';
  static bool _nameActiveStatus = false;
  static bool _usernameActiveStatus = false;

  String name;
  String username;
  String email;

  @override
  Widget build(BuildContext context) {
    final UserService _userService = Provider.of<UserService>(context, listen: false);
    final AuthService _authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget> [
            PageHeader("Account"),
            StreamBuilder(
              stream: _authService.firebaseUser,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingIndicator();
                }
                final FirebaseUser _userData = snapshot.data;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.mail,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        initialValue: _userData.email,
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(height: 10,)
                    ),
                  ],
                );
              }
            ),
            StreamBuilder(
            stream: _userService.userData,
            builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingIndicator();
                }
                final UserData _userData = snapshot.data;
                return Column(
                    children: <Widget> [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.face,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextFormField(
                              onChanged: (value) {
                                name = value;
                              },
                              initialValue: _userData.displayName,
                              enabled: _nameActiveStatus,
                              decoration: InputDecoration(
                                labelText: "Name",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: (_nameActiveStatus ? Icon(Icons.check) : Icon(Icons.edit)),
                              onPressed: () {
                                setState(() {
                                  if (_nameActiveStatus) {
                                    _nameActiveStatus = false;
                                    _userService.updateName(name);
                                  } else {
                                    _nameActiveStatus = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextFormField(
                              onChanged: (value) {
                                username = value;
                              },
                              initialValue: _userData.userName,
                              enabled: _usernameActiveStatus,
                              decoration: InputDecoration(
                                labelText: "Username",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: (_usernameActiveStatus ? Icon(Icons.check) : Icon(Icons.edit)),
                              onPressed: () {
                                setState(() {
                                  if (_usernameActiveStatus) {
                                    _usernameActiveStatus = false;
                                    _userService.updateUsername(username);
                                  } else {
                                    _usernameActiveStatus = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                );},
            ),
          ],
        ),
      ),
    );
  }
}