import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/user.dart';
import 'package:project_fomo/backend/services/auth_service.dart';
import 'package:provider/provider.dart';

class AppBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, AsyncSnapshot<User> userSnapshot)
      builder;

  const AppBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return StreamBuilder<User>(
      stream: authService.signedInUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final User user = snapshot.data;

          return MultiProvider(
            providers: [
              Provider<User>.value(value: user),
            ],
            child: builder(context, snapshot),
          );
        }

        return builder(context, snapshot);
      },
    );
  }
}
