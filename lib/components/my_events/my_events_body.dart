import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/blocs/my_events_bloc.dart';

import '../shared/vertical_event_listing.dart';

class MyEventsBody extends StatefulWidget {
  @override
  _MyEventsBodyState createState() => _MyEventsBodyState();
}

class _MyEventsBodyState extends State<MyEventsBody> {
  MyEventsBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<MyEventsBloc>(context, listen: false);
    _bloc.refreshEventCategories();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        StreamBuilder(git 
          stream: _bloc.interestedEvents,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LoadingIndicator();
            }
            List<Event> interestedEvents = snapshot.data;
            return VerticalEventListing(events: interestedEvents);
          },
        ),
        StreamBuilder(
          stream: _bloc.goingEvents,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LoadingIndicator();
            }
            List<Event> goingEvents = snapshot.data;
            return VerticalEventListing(events: goingEvents);
          },
        ),
      ],
    );
  }

}