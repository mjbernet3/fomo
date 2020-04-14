import 'package:flutter/material.dart';
import 'package:project_fomo/components/my_events/MyAppBar.dart';
import 'package:project_fomo/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/services/user_service.dart';
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

  @override
  Widget build(BuildContext context) {
    final UserService _userService =
      Provider.of<UserService>(context, listen: false);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyAppbar(
          tabBar: TabBar(
            indicatorColor: AppTextColor.mediumEmphasis,
            labelColor: AppTextColor.highEmphasis,
            unselectedLabelColor: AppTextColor.disabled,
            labelPadding: EdgeInsets.only(top: 10.0),
            labelStyle: TextStyle(
                fontSize: AppFontSize.size20,
                fontWeight: AppFontWeight.bold,
                fontFamily: AppFontFamily.family
            ),
            tabs: pageTabs,
          ),

          title: PageHeader("My Events")
        ),
        body: TabBarView(
          children: [
            StreamBuilder(
              stream: _userService.userData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingIndicator();
                }

                final UserData _userData = snapshot.data;

                List<Event> interestedEvents = List<Event>.from(_userData.interested.where((i) => i.flag == true));

                return VerticalEventListing(events: interestedEvents);
              },
            ),
            StreamBuilder(
              stream: _userService.userData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingIndicator();
                }

                final UserData _userData = snapshot.data;

                List<Event> goingEvents = List<Event>.from(_userData.going.where((i) => i.flag == true));

                return VerticalEventListing(events: goingEvents);
              }
            )
          ],
        )
      )
    );
  }
}
