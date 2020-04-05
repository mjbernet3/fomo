import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/pages/forgot_pass_page.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:provider/provider.dart';

class AccountBody extends StatefulWidget {
  final String name;
  final String email;
  final String username;
  final UserService userService;
  AccountBody(this.name, this.email, this.username, this.userService);

  @override
  _AccountBodyState createState() => _AccountBodyState(name: name, username: username, email: email, userService: userService);
}


class _AccountBodyState extends State<AccountBody> {
  static String pageRoute = '/account';
  static bool _emailActiveStatus = false;
  static bool _nameActiveStatus = false;
  static bool _usernameActiveStatus = false;

  String name;
  String email;
  String username;
  UserService userService;

  _AccountBodyState({@required this.name, @required this.email, @required this.username, @required this.userService});

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.email,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    initialValue: email,
                    enabled: _emailActiveStatus,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: (_emailActiveStatus ? Icon(Icons.check) : Icon(Icons.edit)),
                    onPressed: () {
                      setState(() {
                        if (_emailActiveStatus) {
                          _emailActiveStatus = false;
                        } else {
                          _emailActiveStatus = true;
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
                    Icons.face,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    onChanged: (value) {
                      name = value;
                    },
                    initialValue: name,
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
                          userService.updateName(name);
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
                    initialValue: username,
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
                          userService.updateUsername(username);
                        } else {
                          _usernameActiveStatus = true;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
//            FlatButton(
//              onPressed: () {
//                Navigator.pushNamed(context, ForgotPassPage.pageRoute);
//              },
//              child: Text(
//                'Forgot Password?',
//                style: TextStyle(
//                  color: AppTextColor.mediumEmphasis,
//                  fontFamily: AppFontFamily.family,
//                  fontSize: AppFontSize.size14,
//                ),
//              ),
//            ),
          ],

        ),
      ),
    );
  }
}