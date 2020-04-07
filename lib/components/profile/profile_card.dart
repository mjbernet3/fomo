import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class ProfileCard extends StatelessWidget {
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
                image: NetworkImage(
                    'https://www.knack.com/images/about/default-profile.png'),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Fake Username that is really really really long',
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
  }
}
