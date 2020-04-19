import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class FriendsListCard extends StatelessWidget {
  final String userid;

  FriendsListCard({@required this.userid});

  @override
  Widget build(BuildContext context) {
    final UserService _userService =
        Provider.of<UserService>(context, listen: false);

    return StreamBuilder(
      stream: _userService.otherUserData(userid),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingIndicator();
        }

        final UserData _userData = snapshot.data;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          right: 0,
                        ),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(_userData.profileUrl),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          _userData.displayName,
                          style: TextStyle(
                            fontWeight: AppFontWeight.bold,
                            fontSize: AppFontSize.size18,
                            fontFamily: AppFontFamily.family,
                            color: AppTextColor.title,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          _userData.userName,
                          style: TextStyle(
                            fontWeight: AppFontWeight.normal,
                            fontSize: AppFontSize.size16,
                            fontFamily: AppFontFamily.family,
                            color: AppTextColor.mediumEmphasis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      },
    );
  }
}
