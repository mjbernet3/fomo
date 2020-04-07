import 'package:flutter/material.dart';
import 'package:project_fomo/components/profile/profile_card.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/pages/friends_list_page.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class FriendsScroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserService _userService =
        Provider.of<UserService>(context, listen: false);

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  'Friends',
                  style: TextStyle(
                    fontSize: AppFontSize.size22,
                    fontFamily: AppFontFamily.family,
                    fontWeight: AppFontWeight.bold,
                    color: AppTextColor.title,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, FriendsListPage.pageRoute);
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      "View All",
                      style: TextStyle(
                        color: AppTextColor.mediumEmphasis,
                        fontSize: AppFontSize.size14,
                        fontFamily: AppFontFamily.family,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: AppFontSize.size14,
                        color: AppTextColor.mediumEmphasis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        StreamBuilder(
          stream: _userService.userData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LoadingIndicator();
            }
            final UserData _userData = snapshot.data;
            List<dynamic> friends = _userData.friends;
            print(friends.length);
            return SizedBox(
              height: 110,
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: friends.length,
                itemBuilder: (context, index) => SizedBox(
                  width: 15.0,
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 110,
                  height: 100,
                  child: ProfileCard(userid: friends[index]),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 15),
        Divider(color: Colors.grey),
      ],
    );
  }
}
