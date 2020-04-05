import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/style.dart';

class MyEventsPage extends StatelessWidget {
  static const String pageRoute = '/';

  final List<Tab> pageTabs = <Tab>[
    Tab(text: 'Interested'),
    Tab(text: 'Going'),
  ];

  @override
  Widget build(BuildContext context) {
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
              VerticalEventListing(),
              VerticalEventListing()
            ]
        ),
      ),
    );
  }
}
