import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/discover/event_card.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class FeaturedCarousel extends StatelessWidget {
  final List<Event> events;

  FeaturedCarousel(this.events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        sliderHeader(),
        sliderProvider(events),
      ],
    );
  }
}

Widget sliderHeader() {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: Padding(
      padding: EdgeInsets.only(left: 3.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text("Featured", style: TextStyle())),
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
      height: 275,
      viewportFraction: 1.0,
      onPageChanged: (int index) => (sliderModel.index = index),
      items: events
          .map<Widget>(
            (event) => Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
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
        gradient: activated ? AppColor.gradient : null,
      ),
    ),
  );
}
