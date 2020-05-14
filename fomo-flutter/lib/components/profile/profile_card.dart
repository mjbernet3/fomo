import 'package:flutter/material.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/style.dart';

class ProfileCard extends StatelessWidget {
  final UserData friend;

  const ProfileCard({this.friend});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      child: Column(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(friend.profileUrl),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            friend.displayName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppTextColor.highEmphasis,
              fontSize: AppFontSize.size14,
              fontFamily: AppFontFamily.family,
              fontWeight: AppFontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
