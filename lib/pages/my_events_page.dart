import 'package:flutter/material.dart';
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
                stream: _userService.userData,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return LoadingIndicator();
                  }

                  final UserData _userData = snapshot.data;

                  return VerticalEventListing(events: List<Event>.from(_userData.going.where((i) => i.flag == true)));
                }
              ),
              StreamBuilder(
                  stream: _userService.userData,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return LoadingIndicator();
                    }

                    final UserData _userData = snapshot.data;

                    return VerticalEventListing(events: List<Event>.from(_userData.interested.where((i) => i.flag == true)));
                  }
              )
            ]
        ),
      ),
    );
  }
}
