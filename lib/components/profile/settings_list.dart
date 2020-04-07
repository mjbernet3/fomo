import 'package:flutter/material.dart';
import 'package:project_fomo/components/profile/settings_item.dart';
import 'package:project_fomo/pages/about_page.dart';
import 'package:project_fomo/pages/account_page.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class SettingList extends StatelessWidget {
  final bool shouldNotify;
  final bool shouldLocate;

  SettingList({
    @required this.shouldNotify,
    @required this.shouldLocate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: Text(
            "Settings",
            style: TextStyle(
              fontSize: AppFontSize.size22,
              fontFamily: AppFontFamily.family,
              fontWeight: AppFontWeight.bold,
              color: AppTextColor.title,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Divider(color: Colors.grey),
        SettingsItem(
          name: 'Location Services',
          trailing: Switch(
            value: shouldLocate,
            activeColor: Color(0xFFF01844),
            onChanged: (bool) => print('Setting location services to $bool'),
          ),
        ),
        Divider(color: Colors.grey),
        SettingsItem(
          name: 'Notifications',
          trailing: Switch(
            value: shouldNotify,
            activeColor: Color(0xFFF01844),
            onChanged: (bool) => print('Setting notifications to $bool'),
          ),
        ),
        Divider(color: Colors.grey),
        SettingsItem(
          padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
          onPressed: () => Navigator.pushNamed(context, AccountPage.pageRoute),
          name: 'Account',
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 15.0,
            color: AppTextColor.mediumEmphasis,
          ),
        ),
        Divider(color: Colors.grey),
        SettingsItem(
          padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
          onPressed: () => Navigator.pushNamed(context, AboutPage.pageRoute),
          name: 'About',
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 15.0,
            color: AppTextColor.mediumEmphasis,
          ),
        ),
        Divider(color: Colors.grey),
        SettingsItem(
            padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
            onPressed: () =>
                Provider.of<AuthService>(context, listen: false).signOut(),
            name: 'Sign Out'),
      ],
    );
  }
}
