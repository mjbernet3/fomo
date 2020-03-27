import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/discover_bloc.dart';
import 'package:project_fomo/components/discover/discover_body.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:provider/provider.dart';

class DiscoverPage extends StatelessWidget {
  static const String pageRoute = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<DiscoverBloc>(
        create: (context) => DiscoverBloc(
          eventService: Provider.of<EventService>(
            context,
            listen: false,
          ),
        ),
        dispose: (context, bloc) => bloc.dispose(),
        child: DiscoverBody(),
      ),
    );
  }
}
