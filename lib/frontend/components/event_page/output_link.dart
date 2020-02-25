import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class OutputLink extends StatelessWidget {
  final String url;
  final String title;
  final IconData displayIcon;

  OutputLink(
      {@required this.title, @required this.url, @required this.displayIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF343434),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(
                displayIcon,
                color: AppColor.dp24,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 6,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: AppFontFamily.family,
                  color: AppTextColor.highEmphasis,
                  fontSize: AppFontSize.size18,
                  fontWeight: AppFontWeight.normal,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.open_in_new,
                    color: AppColor.dp24,
                  ),
                  onPressed: () {
                    print('Launch URL');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
