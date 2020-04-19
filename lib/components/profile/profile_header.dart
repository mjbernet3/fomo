import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/gradient_icon.dart';
import 'package:project_fomo/style.dart';

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
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Container(
                      width: 125,
                      height: 125,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(profileUrl),
                        ),
                      ),
                    ),
                  ),
                  GradientIcon(
                    icon: Icons.add_circle,
                    size: 35,
                  ),
                ],
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
