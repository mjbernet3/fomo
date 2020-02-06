import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/event_slider.dart';
import 'package:project_fomo/frontend/components/style/fomo_color.dart';

final Event event1 = Event(
  title: "My Event 1",
  venue: "SAE",
  date: DateTime.now(),
  imageUrl: 'https://www.ericholscher.com/_images/pacman.png',
);

final Event event2 = Event(
  title: "My Event 1",
  venue: "SAE",
  date: DateTime.now(),
  imageUrl: 'https://www.ericholscher.com/_images/pacman.png',
);

final Event event3 = Event(
  title: "My Event 1",
  venue: "SAE",
  date: DateTime.now(),
  imageUrl: 'https://www.ericholscher.com/_images/pacman.png',
);

final Event event4 = Event(
  title: "My Event 1",
  venue: "SAE",
  date: DateTime.now(),
  imageUrl: 'https://www.ericholscher.com/_images/pacman.png',
);

final Event event5 = Event(
  title: "My Event 1",
  venue: "SAE",
  date: DateTime.now(),
  imageUrl: 'https://www.ericholscher.com/_images/pacman.png',
);

final List<Event> events = [event1, event2, event3, event4, event5];

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FomoColor.background,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(child: EventCarouselSlider('Popular', events)),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
