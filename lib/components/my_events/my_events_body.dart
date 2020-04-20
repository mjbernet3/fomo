import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/my_events_bloc.dart';
import 'package:project_fomo/components/shared/future_card_listing.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:provider/provider.dart';

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
        StreamBuilder(
            stream: Provider.of<UserService>(context, listen: false).userData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              List<dynamic> interestedEventIds = snapshot.data.interested;
              return FutureCardListing(events: interestedEventIds);
            }),
        StreamBuilder(
          stream: Provider.of<UserService>(context, listen: false).userData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            List<dynamic> goingEventIds = snapshot.data.going;
            return FutureCardListing(events: goingEventIds);
          },
        ),
      ],
    );
  }

  Future<List<dynamic>> getListFuture(List<dynamic> eventIds) async {
    print(eventIds);
    List<Event> events = [];
    for (dynamic id in events) {
      Event event = await EventService.getEventFromDocRef(id);
      events.add(event);
    }
    print(events);
    return events;
  }
}
