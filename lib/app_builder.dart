import 'package:flutter/material.dart';
import 'package:project_fomo/models/user.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:project_fomo/services/user_service.dart';
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
              Provider<EventService>(
                create: (context) => EventService(user.uid),
              ),
              Provider<UserService>(
                create: (context) => UserService(user.uid),
              ),
            ],
            child: builder(context, snapshot),
          );
        }

        return builder(context,
            snapshot); // TODO should populate with a error or fail screen
      },
    );
  }
}
