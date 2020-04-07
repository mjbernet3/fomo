import 'package:flutter/material.dart';
import 'package:project_fomo/components/friends/friends_list_card.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class FriendsListPage extends StatelessWidget {
  static const String pageRoute = '/view-all-friends';

  @override
  Widget build(BuildContext context) {
    final UserService _userService =
        Provider.of<UserService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
            Icons.person_add,
            color: Colors.white,
          ))
        ],
        title: Text(
          'All Friends',
          style: TextStyle(
            color: Colors.white,
            fontSize: AppFontSize.size22,
            fontFamily: AppFontFamily.family,
            fontWeight: AppFontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColor.gradient,
            ),
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: StreamBuilder(
        stream: _userService.userData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingIndicator();
          }
          final UserData _userData = snapshot.data;
          List<dynamic> friends = _userData.friends;
          print(friends.length);
          return SizedBox(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: friends.length,
              itemBuilder: (context, index) => SizedBox(
                width: 15.0,
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 90,
                child: FriendsListCard(
                  userid: friends[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
