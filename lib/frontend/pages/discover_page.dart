import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/view_all_page.dart';

class DiscoverPage extends StatelessWidget {
  static const String pageRoute = '/discover';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Discover'),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Color(0xCF40E0D0),
              onPressed: () {
                Navigator.pushNamed(context, ViewAllPage.pageRoute);
              },
              child: Text(
                'View all',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
