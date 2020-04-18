import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/event_page_bloc.dart';
import 'package:project_fomo/blocs/view_all_bloc.dart';
import 'package:project_fomo/models/user.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:project_fomo/services/search_service.dart';
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
                create: (context) => EventService(),
              ),
              Provider<UserService>(
                create: (context) => UserService(user.uid),
              ),
              Provider<SearchService>(
                create: (context) => SearchService(),
              ),
              Provider<EventPageBloc>(
                create: (context) => EventPageBloc(),
                dispose: (context, bloc) => bloc.dispose(),
              ),
              Provider(
                create: (context) => ViewAllBloc(
                  eventService:
                      Provider.of<EventService>(context, listen: false),
                ),
                dispose: (context, bloc) => bloc.dispose(),
              ),
            ],
            child: builder(context, snapshot),
          );
        }

        return builder(context,
            snapshot); // TODO should populate with an error or fail screen
      },
    );
  }
}
