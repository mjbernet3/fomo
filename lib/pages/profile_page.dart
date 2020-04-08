import 'package:flutter/material.dart';
import 'package:project_fomo/components/profile/profile_header.dart';
import 'package:project_fomo/components/profile/settings_list.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static const String pageRoute = '/profile';

  @override
  Widget build(BuildContext context) {
    final UserService _userService =
        Provider.of<UserService>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: _userService.userData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LoadingIndicator();
              }

              final UserData _userData = snapshot.data;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ProfileHeader(
                    displayName: _userData.displayName,
                    userName: _userData.userName,
                    bio: _userData.bio,
                    profileUrl: _userData.profileUrl,
                  ),
                  Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: AppColor.gradient,
                    ),
                  ),
                  SettingList(
                    shouldNotify: _userData.shouldNotify,
                    shouldLocate: _userData.shouldLocate,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
