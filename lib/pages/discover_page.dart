import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/components/discover/event_scroller.dart';
import 'package:project_fomo/components/discover/featured_carousel.dart';
import 'package:project_fomo/components/shared/page_header.dart';

class DiscoverPage extends StatelessWidget {
  static const String pageRoute = '/';

  final List<Event> events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
          child: ListView(
            children: <Widget>[
//              PageHeader("Discover"),
//              FeaturedCarousel(events),
//              EventScroller("Popular", events),
//              EventScroller("Upcoming", events),
//              EventScroller("Nearby", events),
            ],
          ),
        ),
      ),
    );
  }
}
