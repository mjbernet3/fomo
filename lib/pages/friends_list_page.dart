import 'package:flutter/material.dart';
import 'package:project_fomo/components/friends/friends_list_card.dart';
import 'package:project_fomo/style.dart';

class FriendsListPage extends StatelessWidget {
  static const String pageRoute = '/view-all-friends';

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          FriendsListCard(
            displayName: 'Emma Chadwick',
            userName: 'emmausername',
            profileUrl:
                'http://www.eurogeosurveys.org/wp-content/uploads/2014/02/default_profile_pic.jpg',
          ),
          FriendsListCard(
            displayName: 'Matthew Bernet',
            userName: 'mattusername',
            profileUrl:
                'http://www.eurogeosurveys.org/wp-content/uploads/2014/02/default_profile_pic.jpg',
          ),
          FriendsListCard(
            displayName: 'Paul Gibert',
            userName: 'paulusername',
            profileUrl:
                'http://www.eurogeosurveys.org/wp-content/uploads/2014/02/default_profile_pic.jpg',
          ),
          FriendsListCard(
            displayName: 'Aviva Kern',
            userName: 'avivausername',
            profileUrl:
                'http://www.eurogeosurveys.org/wp-content/uploads/2014/02/default_profile_pic.jpg',
          ),
          FriendsListCard(
            displayName: 'Emma Chadwick',
            userName: 'emmausername',
            profileUrl:
                'http://www.eurogeosurveys.org/wp-content/uploads/2014/02/default_profile_pic.jpg',
          ),
          FriendsListCard(
            displayName: 'Matthew Bernet',
            userName: 'mattusername',
            profileUrl:
                'http://www.eurogeosurveys.org/wp-content/uploads/2014/02/default_profile_pic.jpg',
          ),
          FriendsListCard(
            displayName: 'Paul Gibert',
            userName: 'paulusername',
            profileUrl:
                'http://www.eurogeosurveys.org/wp-content/uploads/2014/02/default_profile_pic.jpg',
          ),
          FriendsListCard(
            displayName: 'Aviva Kern',
            userName: 'avivausername',
            profileUrl:
                'http://www.eurogeosurveys.org/wp-content/uploads/2014/02/default_profile_pic.jpg',
          ),
        ],
      ),
    );
  }
}
