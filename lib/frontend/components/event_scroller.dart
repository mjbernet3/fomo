import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/event_card.dart';
import 'package:project_fomo/frontend/components/style/fomo_colors.dart';
import 'package:project_fomo/frontend/components/style/fomo_spacing.dart';
import 'package:project_fomo/frontend/components/style/fomo_text.dart';

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
    padding: FomoEdgeInsets.all[3],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Padding(
          padding: FomoEdgeInsets.left[3],
          child: Text(title, style: FomoTextStyle.largeTitle),
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
        Text("View All", style: FomoTextStyle.smallSubtitle),
        Padding(
          padding: FomoEdgeInsets.left[1],
          child: Icon(Icons.arrow_forward_ios,
              size: FomoFontSize.p2, color: FomoColor.onPrimaryVariant),
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
      itemBuilder: (context, index) => FomoSeparator.verticalSeparator[3],
      separatorBuilder: (context, index) =>
          SizedBox(width: 275, child: SmallEventCard.fromEvent(events[index])),
    ),
  );
}
