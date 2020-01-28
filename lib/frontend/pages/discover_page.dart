import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/backend/services/data_store.dart';
import 'package:project_fomo/frontend/components/event_card.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Container(width: 10),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 50),
                  discoverPageTitle('Discover'),
                  //FeaturedCarouselSlider(),
                  SizedBox(height: 20),
                  FeaturedCarouselSlider(),
                  SizedBox(height: 20),
                  eventCategory(
                    title: 'Upcoming',
                    stream: DataStore.getUpcomingEventsStream(),
                    height: MediaQuery.of(context).size.height / 4,
                    itemExtent: MediaQuery.of(context).size.width / 1.8,
                  ),
                  eventCategory(
                    title: 'Popular',
                    stream: DataStore.getPopularEventsStream(),
                    height: MediaQuery.of(context).size.height / 4,
                    itemExtent: MediaQuery.of(context).size.width / 1.8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF121212),
    );
  }
}

Widget discoverPageTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 14.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 35.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF)),
        ),
        SizedBox(
          width: 145.0,
          height: 2.0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
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
                  ]),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget eventCategory({
  @required String title,
  @required Stream<Iterable<Event>> stream,
  double height,
  double itemExtent,
}) {
  return Column(
    children: <Widget>[
      eventCategoryHeader(title),
      SizedBox(height: 10.0),
      SizedBox(
        height: height,
        child: eventCategoryView(
          stream: stream,
          itemExtent: itemExtent,
        ),
      ),
      SizedBox(height: 16.0)
    ],
  ); // EventCategoryView(),
}

Widget eventCategoryHeader(String title) {
  return Padding(
    padding: EdgeInsets.only(left: 15, right: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        eventCategoryHeaderTitle(title),
        eventCategoryHeaderViewAllButton(),
      ],
    ),
  );
}

Widget eventCategoryHeaderTitle(String title) {
  return FittedBox(
    fit: BoxFit.contain,
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: TextStyle(
        fontSize: 22.0,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
    ),
  );
}

Widget eventCategoryHeaderViewAllButton() {
  return GestureDetector(
    onTap: null,
    child: Row(
      children: <Widget>[
        Text(
          'View All',
          style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0x99FFFFFF)),
        ),
        SizedBox(width: 5),
        Icon(Icons.arrow_forward_ios, size: 12, color: Color(0x99FFFFFF)),
      ],
    ),
  );
}

Widget eventCategoryView(
    {@required Stream<Iterable<Event>> stream, double itemExtent}) {
  return StreamBuilder(
    stream: stream,
    builder: (context, snapshot) {
      List<Event> events = [];
      if (snapshot.hasError) {
        //TODO handle error
        return ListView();
      } else if (snapshot.data == null) {
        //TODO: handle null data
        return ListView();
      } else {
        snapshot.data.forEach((event) => events.add(event));
        return ListView(
          scrollDirection: Axis.horizontal,
          itemExtent: itemExtent,
          children: events.map((event) => eventCard(event)).toList(),
        );
      }
    },
  );
}

class FeaturedCarouselSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: DataStore.getFeaturedEventsStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(); //TODO: Handle snapshot error
            } else if (snapshot.data == null) {
              //TODO: Handle null data
              return Container();
            } else {
              return CarouselSlider(
                height: MediaQuery.of(context).size.height / 3,
                viewportFraction: 1.0,
                items: snapshot.data
                    .map<Widget>((event) => eventCard(event))
                    .toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
