import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class InfoLine extends StatelessWidget {
  final String type;
  final String content;

  InfoLine({@required this.type, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Text(
            type,
            style: TextStyle(
              fontFamily: AppFontFamily.family,
              color: AppTextColor.mediumEmphasis,
              fontSize: AppFontSize.size18,
              fontWeight: AppFontWeight.normal,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              content,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: AppFontWeight.normal,
                fontFamily: AppFontFamily.family,
                fontSize: AppFontSize.size18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
