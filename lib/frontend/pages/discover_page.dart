import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/discover/event_scroller.dart';
import 'package:project_fomo/frontend/components/discover/featured_carousel.dart';
import 'package:project_fomo/frontend/components/shared/page_header.dart';

String url =
    'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6358/6358944_sd.jpg;maxHeight=640;maxWidth=550';

final List<Event> events = [
  Event(
      name: 'My Event 1',
      venueName: 'SAE',
      date: "Thurs, January 13th",
      imageUrl: url),
  Event(
      name: 'My Event 2',
      venueName: 'Kappa Alpha',
      date: "Thurs, January 13th",
      imageUrl: url),
  Event(
      name: 'My Event 3',
      venueName: 'PiKapp',
      date: "Thurs, January 13th",
      imageUrl: url),
  Event(
      name: 'My Event 4',
      venueName: 'PIKE',
      date: "Thurs, January 13th",
      imageUrl: url),
  Event(
      name: 'My Event 5',
      venueName: 'ADPi',
      date: "Thurs, January 13th",
      imageUrl: url),
];

class DiscoverPage extends StatelessWidget {
  static const String pageRoute = '/discover';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              PageHeader("Discover"),
              FeaturedCarousel(events),
              EventScroller("Popular", events),
              EventScroller("Upcoming", events),
              EventScroller("Nearby", events),
            ],
          ),
        ),
      ),
    );
  }
}
