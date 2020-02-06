import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/style/fomo_color.dart';
import 'package:project_fomo/frontend/components/style/fomo_spacing.dart';
import 'package:project_fomo/frontend/components/style/fomo_text.dart';

class SmallEventCard extends StatelessWidget {
  final Event event;

  SmallEventCard.fromEvent(this.event);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 200,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: FomoColor.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              cardImage(event.imageUrl),
              cardTray(event.title, event.venue, event.date),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardImage(String imageUrl) {
  return Expanded(
    child: FittedBox(
      fit: BoxFit.cover,
      child: Image.network(imageUrl),
    ),
  );
}

Widget cardTray(String title, String venue, DateTime date) {
  return Padding(
    padding: FomoEdgeInsets.left[2],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FomoSeparator.horizontalSeparator[2],
        cardTitle(
          title,
        ),
        FomoSeparator.horizontalSeparator[0],
        Text(
          venue,
          style: FomoTextStyle.smallSubtitle,
        ),
        FomoSeparator.horizontalSeparator[0],
        Text(
          getDateString(date),
          style: FomoTextStyle.smallSubtitle,
        ),
        FomoSeparator.horizontalSeparator[2],
      ],
    ),
  );
}

Widget cardTitle(String title) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Column(
        children: <Widget>[
          Text(
            "",
            style: FomoTextStyle.smallTitle,
          ),
          Text(
            "",
            style: FomoTextStyle.smallTitle,
          ),
        ],
      ),
      Text(
        title,
        style: FomoTextStyle.smallTitle,
        maxLines: 2,
      ),
    ],
  );
}

String getDateString(DateTime date) {
  return DateFormat('MMMMEEEEd').format(date);
}
