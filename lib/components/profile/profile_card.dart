import 'package:flutter/material.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatelessWidget {
  final String userid;

  ProfileCard({@required this.userid});

  @override
  Widget build(BuildContext context) {
    final UserService _userService =
        Provider.of<UserService>(context, listen: false);

    return StreamBuilder(
      stream: _userService.otherUserData(userid),
      builder: (context, snapshot) {
        final UserData _userData = snapshot.data;

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
                    image: NetworkImage(_userData.profileUrl),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                _userData.displayName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppTextColor.highEmphasis,
                  fontSize: AppFontSize.size14,
                  fontFamily: AppFontFamily.family,
                  fontWeight: AppFontWeight.normal,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
