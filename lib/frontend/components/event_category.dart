import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/event_card.dart';
import 'package:provider/provider.dart';

const eventCategoryTitlePadding = 22.0;
const double eventCategoryHeaderPadding = 18.0;
const double eventCategoryTitleFontSize = 25.0;
const double viewAllButtonFontSize = 15.0;
const double viewAllButtonIconSpacerSize = 8.0;
const double viewAllButtonPadding = 8.0;
const double eventCategoryBodySidePadding = 15.0;
const double eventCardSpacing = 10.0;

abstract class EventCategory extends StatelessWidget {
  final List<Event> events;

  EventCategory(this.events);
}

class ListViewEventCategory extends EventCategory {
  final String title;
  final List<Event> events;
  final double cardHeight;
  final double cardExtent;

  ListViewEventCategory(
      {@required this.title,
      @required this.events,
      this.cardHeight: 175.0,
      this.cardExtent: 200.0})
      : super(events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        listViewEventCategoryHeader(title),
        listViewEventCategoryBody(events,
            cardHeight: cardHeight,
            cardExtent: cardExtent,
            cardSpacing: eventCardSpacing),
      ],
    );
  }
}

Widget listViewEventCategoryHeader(String title) {
  return Padding(
    padding: EdgeInsets.only(bottom: eventCategoryHeaderPadding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        eventCategoryTitle(title),
        viewAllButton(),
      ],
    ),
  );
}

Widget eventCategoryTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: eventCategoryTitlePadding),
    child: Text(
      title,
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: eventCategoryTitleFontSize,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
    ),
  );
}

Widget viewAllButton() {
  return Padding(
    padding: const EdgeInsets.only(right: viewAllButtonPadding),
    child: GestureDetector(
      onTap: null,
      child: Row(
        children: <Widget>[
          Text(
            'View All',
            style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: viewAllButtonFontSize,
                fontWeight: FontWeight.w600,
                color: Color(0x99FFFFFF)),
          ),
          SizedBox(
            width: viewAllButtonIconSpacerSize,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: viewAllButtonFontSize - 1.0,
            color: Color(0x99FFFFFF),
          ),
        ],
      ),
    ),
  );
}

Widget listViewEventCategoryBody(
  List<Event> events, {
  @required double cardHeight,
  @required double cardExtent,
  @required double cardSpacing,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: eventCategoryBodySidePadding),
    child: SizedBox(
      height: cardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: cardSpacing),
        itemBuilder: (BuildContext context, int index) => SizedBox(
          width: cardExtent,
          child: EventCard(events[index]),
        ),
      ),
    ),
  );
}

class CarouselSliderEventCategory extends EventCategory {
  final String title;
  final List<Event> events;
  final double cardHeight;

  CarouselSliderEventCategory({
    @required this.title,
    @required this.events,
    @required this.cardHeight,
  }) : super(events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        carouselSliderEventCategoryHeader(title),
        carouselSliderEventCategoryBody(events, cardHeight: cardHeight),
      ],
    );
  }
}

Widget carouselSliderEventCategoryHeader(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: eventCategoryHeaderPadding),
    child: Align(
      alignment: Alignment.centerLeft,
      child: eventCategoryTitle(title),
    ),
  );
}

Widget carouselSliderEventCategoryBody(List<Event> events,
    {@required double cardHeight}) {
  return ChangeNotifierProvider(
    create: (context) => CarouselSliderModel(),
    child: Column(
      children: <Widget>[
        eventCategoryCarouselSlider(events, cardHeight: cardHeight),
        carouselSliderEllipses(events.length),
      ],
    ),
  );
}

class CarouselSliderModel extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  set index(int index) {
    this._index = index;
    notifyListeners();
  }
}

Widget eventCategoryCarouselSlider(List<Event> events,
    {@required double cardHeight}) {
  return Consumer<CarouselSliderModel>(
    builder: (context, sliderModel, child) {
      return CarouselSlider(
        viewportFraction: 1.0,
        height: cardHeight,
        onPageChanged: (int index) => (sliderModel.index = index),
        items: events
            .map<Widget>((event) => Padding(
                  padding: const EdgeInsets.only(
                      left: eventCategoryBodySidePadding,
                      right: eventCategoryBodySidePadding),
                  child: EventCard(event),
                ))
            .toList(),
      );
    },
  );
}

Widget carouselSliderEllipses(int count) {
  return Consumer<CarouselSliderModel>(builder: (context, sliderModel, child) {
    List<Widget> ellipses = [];
    for (var i = 0; i < count; i++) {
      ellipses.add(carouselSliderEllipse(i == sliderModel.index));
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
  });
}

Widget carouselSliderEllipse(bool highlighted) {
  return SizedBox(
    width: 12,
    height: 12,
    child: DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: highlighted ? null : Color(0x0FFFFFFF),
        gradient: highlighted
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
