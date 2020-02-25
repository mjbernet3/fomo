import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/discover/event_card.dart';
import 'package:project_fomo/style.dart';

class EventScroller extends StatelessWidget {
  final String title;
  final List<Event> events;

  EventScroller(this.title, this.events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        srollerHeader(title),
        scroller(events),
      ],
    );
  }
}

Widget srollerHeader(String title) {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(3.0),
          child: Text(
            title,
            style: TextStyle(),
          ),
        ),
        viewAllButton(),
      ],
    ),
  );
}

Widget viewAllButton() {
  return GestureDetector(
    onTap: null,
    child: Row(
      children: <Widget>[
        Text(
          "View All",
          style: TextStyle(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.arrow_forward_ios,
            size: AppFontSize.size16,
            color: AppColor.dp12,
          ),
        ),
      ],
    ),
  );
}

Widget scroller(List<Event> events) {
  return SizedBox(
    height: 250,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: events.length,
      itemBuilder: (context, index) => SizedBox(
        width: 15.0,
      ),
      separatorBuilder: (context, index) =>
          SizedBox(width: 275, child: SmallEventCard.fromEvent(events[index])),
    ),
  );
}
