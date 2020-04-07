import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class FriendsListCard extends StatelessWidget {
  final String displayName;
  final String userName;
  final String profileUrl;

  FriendsListCard({
    @required this.displayName,
    @required this.userName,
    @required this.profileUrl,
  });

  @override
  Widget build(BuildContext context) {
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
                          image: NetworkImage(profileUrl),
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
                      displayName,
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
                      '@$userName',
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
  }
}
