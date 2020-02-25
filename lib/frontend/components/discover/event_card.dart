import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/style.dart';

class SmallEventCard extends StatelessWidget {
  final Event event;

  SmallEventCard.fromEvent(this.event);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColor.dp3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            cardImage(event.imageUrl),
            cardTray(event.name, event.venueName, DateTime.now()),
          ],
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
    padding: EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        cardTitle(
          title,
        ),
        Text(
          venue,
          style: TextStyle(),
        ),
        Text(
          getDateString(date),
          style: TextStyle(),
        ),
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
            style: TextStyle(),
          ),
          Text(
            "",
            style: TextStyle(),
          ),
        ],
      ),
      Text(
        title,
        style: TextStyle(),
        maxLines: 2,
      ),
    ],
  );
}

String getDateString(DateTime date) {
  return DateFormat('MMMMEEEEd').format(date);
}
