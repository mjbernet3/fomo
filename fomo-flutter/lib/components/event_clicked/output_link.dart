import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';
import 'package:url_launcher/url_launcher.dart';

class OutputLink extends StatelessWidget {
  final String url;
  final String title;
  final IconData displayIcon;

  OutputLink({
    this.title,
    this.url,
    this.displayIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
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
                  child: Icon(
                    Icons.open_in_new,
                    color: AppColor.dp24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchUrl() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Unable to launch Url'); // TODO: Inform user of error
    }
  }
}
