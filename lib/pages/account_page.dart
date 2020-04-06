import 'package:flutter/material.dart';
import 'package:project_fomo/components/account/account_body.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/user_data.dart';

class AccountPage extends StatelessWidget {
  static const String pageRoute = '/account';

  @override
  Widget build(BuildContext context) {
    final UserService _userService = Provider.of<UserService>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: _userService.userData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LoadingIndicator();
              }
              final UserData _userData = snapshot.data;
              return AccountBody( );
            }),
      ),
    );
  }
}
