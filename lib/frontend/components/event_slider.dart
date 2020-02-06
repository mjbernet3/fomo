import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/event_card.dart';
import 'package:project_fomo/frontend/components/style/fomo_spacing.dart';
import 'package:project_fomo/frontend/components/style/fomo_text.dart';
import 'package:provider/provider.dart';

class EventCarouselSlider extends StatelessWidget {
  final String title;
  final List<Event> events;

  EventCarouselSlider(this.title, this.events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        sliderHeader(title),
        sliderProvider(events),
      ],
    );
  }
}

Widget sliderHeader(String title) {
  return Padding(
    padding: FomoEdgeInsets.all[3],
    child: Padding(
      padding: FomoEdgeInsets.left[3],
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title, style: FomoTextStyle.largeTitle)),
    ),
  );
}

class SliderModel extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  set index(int index) {
    this._index = index;
    notifyListeners();
  }
}

Widget sliderProvider(List<Event> events) {
  return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child: Column(
        children: <Widget>[
          slider(events),
          ellipses(events.length),
        ],
      ));
}

Widget slider(List<Event> events) {
  return Consumer<SliderModel>(
    builder: (context, sliderModel, child) => CarouselSlider(
      viewportFraction: 1.0,
      onPageChanged: (int index) => (sliderModel.index = index),
      items: events
          .map<Widget>(
            (event) => Padding(
              padding: EdgeInsets.only(
                  left: FomoSpacer.unit[3], right: FomoSpacer.unit[3]),
              child: SmallEventCard.fromEvent(event),
            ),
          )
          .toList(),
    ),
  );
}

Widget ellipses(int numEvents) {
  return Consumer<SliderModel>(
    builder: (context, sliderModel, child) {
      List<Widget> ellipses = [];
      for (var i = 0; i < numEvents; i++) {
        ellipses.add(ellipse(i == sliderModel.index));
      }
      return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ellipses,
          ),
        ),
      );
    },
  );
}

Widget ellipse(bool activated) {
  return SizedBox(
    width: 12,
    height: 12,
    child: DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: activated ? null : Color(0x0FFFFFFF),
        gradient: activated
            ? LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFFF6C1A),
                  Color(0xFFF01844),
                  Color(0xFF7E0BC9),
                ],
                stops: [
                  0.0,
                  .528,
                  1.0,
                ],
              )
            : null,
      ),
    ),
  );
}
