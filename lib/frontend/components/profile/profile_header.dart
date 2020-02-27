import 'package:flutter/material.dart';

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
    return Column(
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(profileUrl),
            )
          ),
        ),
        Text(bio),
      ],
    );
  }
}