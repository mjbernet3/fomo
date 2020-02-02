import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/user.dart';
import 'package:provider/provider.dart';

//TODO: Recreate discover page UI
class DiscoverPage extends StatelessWidget {
  static const pageRoute = '/discover';

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('How did you get in here?'),
            SizedBox(
              height: 40.0,
            ),
            RaisedButton(
              color: Color(0xCF40E0D0),
              onPressed: () {
                print(user.uid);
                print(user.email);
                print(user.displayName);
                print(user.photoUrl);
              },
              child: Text(
                'Print user details',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
