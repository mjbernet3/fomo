import 'package:flutter/material.dart';
import 'package:project_fomo/components/account/edit_field.dart';
import 'package:project_fomo/models/user.dart';
import 'package:project_fomo/pages/forgot_pass_page.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/user_data.dart';

class AccountPage extends StatefulWidget {
  static const String pageRoute = '/account';

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final UserService _userService =
        Provider.of<UserService>(context, listen: false);
    final AuthService _authService =
        Provider.of<AuthService>(context, listen: false);

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
        title: Text(
          'Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: AppFontSize.size22,
            fontFamily: AppFontFamily.family,
            fontWeight: AppFontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColor.gradient,
            ),
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: _authService.signedInUser,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingIndicator();
                }
                final User _user = snapshot.data;
                return EditField(
                  data: _user.email,
                  icon: Icons.mail,
                  toChange: null,
                  dataActive: false,
                  editable: false,
                  title: "Email",
                );
              },
            ),
            StreamBuilder(
              stream: _userService.userData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingIndicator();
                }
                final UserData _userData = snapshot.data;
                return Column(children: <Widget>[
                  EditField(
                    data: _userData.displayName,
                    icon: Icons.face,
                    toChange: (String data) {
                      _userService.updateName(data);
                    },
                    dataActive: false,
                    editable: true,
                    title: "Name",
                  ),
                  EditField(
                    data: _userData.userName,
                    icon: Icons.person,
                    toChange: (String data) {
                      _userService.updateUsername(data);
                    },
                    dataActive: false,
                    editable: true,
                    title: "Username",
                  ),
                ]);
              },
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, ForgotPassPage.pageRoute);
              },
              child: Text(
                'Reset Password',
                style: TextStyle(
                  color: AppTextColor.mediumEmphasis,
                  fontFamily: AppFontFamily.family,
                  fontSize: AppFontSize.size14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
