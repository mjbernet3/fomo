import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/gradient_icon.dart';
import 'package:project_fomo/style.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String tag;
  final String bio;
  final String profileUrl;

  ProfileHeader({@required this.name, @required this.tag,
    @required this.bio, @required this.profileUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 30,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
                children: <Widget> [
                  Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget> [
                        Padding(
                          padding: EdgeInsets.only(right: 10,),
                          child: Container(
                            width: 125,
                            height: 125,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(profileUrl),
                              )
                            ),
                          ),
                        ),
                        GradientIcon(icon: Icons.add_circle, size: 35),
                      ],
                    ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: AppFontWeight.bold,
                            fontSize: AppFontSize.size22,
                            fontFamily: AppFontFamily.family,
                            color: AppTextColor.title,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                          tag,
                          style: TextStyle(
                            fontWeight: AppFontWeight.normal,
                            fontSize: AppFontSize.size16,
                            fontFamily: AppFontFamily.family,
                            color: AppTextColor.mediumEmphasis,
                          ),
                      ),
                    ],
                  )
                ]
            ),
            SizedBox(height: 15,),
            Text(
                bio,
                style: TextStyle(
                  fontWeight: AppFontWeight.bold,
                  fontSize: AppFontSize.size16,
                  fontFamily: AppFontFamily.family,
                  color: AppTextColor.title,
                ),
            ),
          ],
      )
    );
  }
}