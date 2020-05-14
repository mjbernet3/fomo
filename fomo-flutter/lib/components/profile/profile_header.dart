import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/components/profile/profile_picture.dart';

class ProfileHeader extends StatelessWidget {
  final String displayName;
  final String userName;
  final String profileUrl;

  ProfileHeader({
    @required this.displayName,
    @required this.userName,
    @required this.profileUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ProfilePicture(
                profileUrl: profileUrl,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    displayName,
                    style: TextStyle(
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.size22,
                      fontFamily: AppFontFamily.family,
                      color: AppTextColor.title,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '@$userName',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: AppFontWeight.normal,
                      fontSize: AppFontSize.size16,
                      fontFamily: AppFontFamily.family,
                      color: AppTextColor.mediumEmphasis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
