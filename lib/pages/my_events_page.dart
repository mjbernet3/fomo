import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/event.dart';

class MyEventsPage extends StatelessWidget {
  static const String pageRoute = '/';

  final List<Tab> pageTabs = <Tab>[
    Tab(text: 'Interested'),
    Tab(text: 'Going'),
  ];

  Event _buildEventItem(DocumentSnapshot document) {
    return Event.fromDocSnapshot(document);
  }

  @override
  Widget build(BuildContext context) {
    final UserService _userService =
      Provider.of<UserService>(context, listen: false);

    final EventService _eventService =
      Provider.of<EventService>(context, listen: false);

    final Stream<UserData> _userStream = _userService.userData;

    final Stream<QuerySnapshot> _eventsStream = _eventService.events;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: AppTextColor.mediumEmphasis,
            labelColor: AppTextColor.highEmphasis,
            unselectedLabelColor: AppTextColor.disabled,
            labelStyle: TextStyle(
              fontSize: AppFontSize.size18,
              fontWeight: AppFontWeight.bold,
              fontFamily: AppFontFamily.family
            ),
            tabs: pageTabs,
          ),
          title: PageHeader("My Events"),
        ),
        body: TabBarView(
          children:
            [
              StreamBuilder(
                stream: _userStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return LoadingIndicator();
                  }

                  final UserData _userData = snapshot.data;

                  List<String> interestedEventsIds = List<String>.from(
                      _userData.interested);

                  List<Event> interestedEvents = [];

                  return StreamBuilder(
                    stream: _eventService.events,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return LoadingIndicator();
                      }

                      for (String id in interestedEventsIds) {
                        for (int index = 0; index < snapshot.data.documents.length; index++) {
                          Event event = _buildEventItem(snapshot.data.documents[index]);
                          if (event.id == id) {
                            interestedEvents.add(event);
                            break;
                          }
                        }
                      }

                      return VerticalEventListing(events: interestedEvents);
                    },
                  );
                }
              ),
              StreamBuilder(
                  stream: _userService.userData,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return LoadingIndicator();
                    }

                    final UserData _userData = snapshot.data;

                    List<String> goingEventIds = List<String>.from(_userData.going);

                    List<Event> goingEvents = [];

                    for (String id in goingEventIds) {
                      final Stream<Event> _eventStream = _eventService.getEvent(id);
                      _eventStream.listen((event) {goingEvents.add(event);});
                    }

                    return VerticalEventListing(events: goingEvents);
                  }
              )
            ]
        ),
      ),
    );
  }
}
