import 'package:flutter/material.dart';
import 'package:project_fomo/components/friends/friends_list_card.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/style.dart';

class FriendsListPage extends StatelessWidget {
  static const String pageRoute = '/friends-list';

  @override
  Widget build(BuildContext context) {
    //TODO: Get friends from navigator arguments

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
      body: SizedBox(
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 0,
          itemBuilder: (context, index) => SizedBox(
            width: 15.0,
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 90,
            child: FriendsListCard(
              friend: UserData(),
            ),
          ),
        ),
      ),
    );
  }
}
