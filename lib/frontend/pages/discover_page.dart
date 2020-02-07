import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/event_scroller.dart';
import 'package:project_fomo/frontend/components/event_slider.dart';
import 'package:project_fomo/frontend/components/headers.dart';
import 'package:project_fomo/frontend/components/style/fomo_colors.dart';
import 'package:project_fomo/frontend/components/style/fomo_spacing.dart';

String url =
    'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6358/6358944_sd.jpg;maxHeight=640;maxWidth=550';

final List<Event> events = [
  Event(title: 'My Event 1', venue: 'SAE', date: DateTime.now(), imageUrl: url),
  Event(
      title: 'My Event 2',
      venue: 'Kappa Alpha',
      date: DateTime.now(),
      imageUrl: url),
  Event(
      title: 'My Event 3',
      venue: 'PiKapp',
      date: DateTime.now(),
      imageUrl: url),
  Event(
      title: 'My Event 4', venue: 'PIKE', date: DateTime.now(), imageUrl: url),
  Event(
      title: 'My Event 5', venue: 'ADPi', date: DateTime.now(), imageUrl: url),
];

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FomoColor.primary,
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            FomoPageHeader("Discover"),
            EventCarouselSlider("Featured", events),
            EventScroller("Popular", events),
            FomoSeparator.horizontalSeparator[3],
            EventScroller("Popular", events),
            FomoSeparator.horizontalSeparator[3],
            EventScroller("Popular", events),
          ],
        )));
  }
}
