import 'package:flutter/material.dart';
import 'package:project_fomo/components/my_events/events_app_bar.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:provider/provider.dart';

class MyEventsPage extends StatelessWidget {
  static const String pageRoute = '/';

  final List<Tab> pageTabs = <Tab>[
    Tab(text: 'Interested'),
    Tab(text: 'Going'),
  ];

  @override
  Widget build(BuildContext context) {
    EventService _eventService =
        Provider.of<EventService>(context, listen: false);
    UserService _userService = Provider.of<UserService>(context, listen: false);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: EventsAppBar(
          tabBar: TabBar(
            indicatorColor: AppTextColor.mediumEmphasis,
            labelColor: AppTextColor.highEmphasis,
            unselectedLabelColor: AppTextColor.disabled,
            labelPadding: EdgeInsets.only(top: 10.0),
            labelStyle: TextStyle(
                fontSize: AppFontSize.size20,
                fontWeight: AppFontWeight.bold,
                fontFamily: AppFontFamily.family),
            tabs: pageTabs,
          ),
          title: PageHeader("My Events"),
        ),
        body: StreamBuilder(
          stream: _eventService.allEvents,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LoadingIndicator();
            }

            Map<String, Event> eventMap = {};
            List<Event> allEvents = snapshot.data;
            allEvents.forEach((event) => eventMap[event.id] = event);

            return TabBarView(
              children: <Widget>[
                StreamBuilder(
                  stream: _userService.userData,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return LoadingIndicator();
                    }

                    UserData userData = snapshot.data;
                    List<Event> interestedEvents = [];
                    userData.interested.forEach(
                        (eventId) => interestedEvents.add(eventMap[eventId]));

                    return VerticalEventListing(events: interestedEvents);
                  },
                ),
                StreamBuilder(
                  stream: _userService.userData,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return LoadingIndicator();
                    }

                    UserData userData = snapshot.data;
                    List<Event> goingEvents = [];
                    userData.going.forEach(
                        (eventId) => goingEvents.add(eventMap[eventId]));

                    return VerticalEventListing(events: goingEvents);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
