import 'package:flutter/material.dart';
import 'package:project_fomo/components/profile/settings_item.dart';
import 'package:project_fomo/components/profile/dynamic_settings_item.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/pages/about_page.dart';
import 'package:project_fomo/pages/account_page.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/user_service.dart';

class SettingList extends StatelessWidget {
  final bool shouldNotify;
  final bool shouldLocate;

  SettingList({
    @required this.shouldNotify,
    @required this.shouldLocate,
  });

  @override
  Widget build(BuildContext context) {
    final UserService _userService =
    Provider.of<UserService>(context, listen: false);

    return StreamBuilder(
        stream: _userService.userData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingIndicator();
          }
          final UserData _userData = snapshot.data;

          return Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: AppFontSize.size22,
                    fontFamily: AppFontFamily.family,
                    fontWeight: AppFontWeight.bold,
                    color: AppTextColor.title,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                DynamicSettingsItem(
                  name: 'Location Services',
                  onPressed: (bool data) {
                    _userService.updateLocation(data);
                  },
                  toggle: _userData.shouldLocate,
                ),
                Divider(color: Colors.grey),
                DynamicSettingsItem(
                  name: 'Notifications',
                  onPressed: (bool data) {
                    _userService.updateNotification(data);
                  },
                  toggle: _userData.shouldNotify,
                ),
                Divider(color: Colors.grey),
                SettingsItem(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
                  onPressed: () =>
                      Navigator.pushNamed(context, AccountPage.pageRoute),
                  name: 'Account',
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15.0,
                    color: AppTextColor.mediumEmphasis,
                  ),
                ),
                Divider(color: Colors.grey),
                SettingsItem(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
                  onPressed: () =>
                      Navigator.pushNamed(context, AboutPage.pageRoute),
                  name: 'About',
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15.0,
                    color: AppTextColor.mediumEmphasis,
                  ),
                ),
                Divider(color: Colors.grey),
                SettingsItem(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 0.0),
                    onPressed: () =>
                        Provider.of<AuthService>(context, listen: false)
                            .signOut(),
                    name: 'Sign Out'),
              ],
            ),
          );
        },
    );
  }
}
