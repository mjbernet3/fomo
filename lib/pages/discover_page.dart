import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/components/discover/event_scroller.dart';
import 'package:project_fomo/components/discover/featured_carousel.dart';
import 'package:project_fomo/components/shared/page_header.dart';

String url =
    'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6358/6358944_sd.jpg;maxHeight=640;maxWidth=550';

final List<Event> events = [
  Event(
      name: 'My Event 1',
      venueName: 'SAE',
      description: "This event will be a lot of fun",
      date: "Thurs, January 13th",
      genres: ['Pop'],
      ticketUrl: 'https://www1.ticketmaster.com/harry-styles-love-on-tour/event/0E00576BA4553316',
      location: {'Latitude': '33.7573', 'Longitude': '-84.3963'},
      imageUrl: url),
  Event(
      name: 'My Event 2',
      venueName: 'Kappa Alpha',
      description: "This event will be a lot of fun",
      date: "Thurs, January 13th",
      genres: ['Pop'],
      ticketUrl: 'https://www1.ticketmaster.com/harry-styles-love-on-tour/event/0E00576BA4553316',
      location: {'Latitude': '33.7573', 'Longitude': '-84.3963'},
      imageUrl: url),
  Event(
      name: 'My Event 3',
      venueName: 'PiKapp',
      description: "This event will be a lot of fun",
      date: "Thurs, January 13th",
      genres: ['Pop'],
      ticketUrl: 'https://www1.ticketmaster.com/harry-styles-love-on-tour/event/0E00576BA4553316',
      location: {'Latitude': '33.7573', 'Longitude': '-84.3963'},
      imageUrl: url),
  Event(
      name: 'My Event 4',
      venueName: 'PIKE',
      description: "This event will be a lot of fun",
      date: "Thurs, January 13th",
      genres: ['Pop'],
      ticketUrl: 'https://www1.ticketmaster.com/harry-styles-love-on-tour/event/0E00576BA4553316',
      location: {'Latitude': '33.7573', 'Longitude': '-84.3963'},
      imageUrl: url),
  Event(
      name: 'My Event 5',
      venueName: 'ADPi',
      description: "This event will be a lot of fun",
      date: "Thurs, January 13th",
      genres: ['Pop'],
      ticketUrl: 'https://www1.ticketmaster.com/harry-styles-love-on-tour/event/0E00576BA4553316',
      location: {'Latitude': '33.7573', 'Longitude': '-84.3963'},
      imageUrl: url),
];

class DiscoverPage extends StatelessWidget {
  static const String pageRoute = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
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
