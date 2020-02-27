import 'package:flutter/material.dart';
import 'package:project_fomo/backend/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/style.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:project_fomo/frontend/pages/about_page.dart';
import 'package:project_fomo/frontend/pages/account_page.dart';

class SettingList extends StatelessWidget {

  TextStyle listName = TextStyle(
    fontSize: AppFontSize.size18,
    fontFamily: AppFontFamily.family,
    fontWeight: AppFontWeight.bold,
    color: AppTextColor.mediumEmphasis,
  );

  Container defaultLine = Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF343434)),
        ),
      ),
  );

  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context);

    return Padding (
      padding: EdgeInsets.all(15),
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
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Location Services",
                      style: listName,
                    ),
                    CustomSwitch(
                      value: true,
                      activeColor: Color(0xFFF01844),
                      onChanged: (bool) {
                        return null;
                      },
                    ),
                  ],
                ),
            ),
            defaultLine,
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Notifications",
                    style: listName,
                  ),
                  CustomSwitch(
                    value: true,
                    activeColor: Color(0xFFF01844),
                    onChanged: (bool) {
                      null;
                    },
                  ),
                ],
              ),
            ),
            defaultLine,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Account",
                  style: listName,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AccountPage(),
                    )
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppTextColor.mediumEmphasis,
                  ),
                ),
              ],
            ),
            defaultLine,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "About",
                  style: listName,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    )
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppTextColor.mediumEmphasis,
                  ),
                ),
              ],
            ),
            defaultLine,
            Padding(
              padding: EdgeInsets.only(top: 15,),
              child: GestureDetector(
                onTap: () {
                  authService.signOut();
                },
                child: Text(
                  "Sign out",
                  style: listName,
                ),
              ),
            ),
          ],
      )
    );
  }

}

