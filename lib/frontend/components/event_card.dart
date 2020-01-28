import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_fomo/backend/models/event.dart';

Widget eventCard(Event event) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    color: Color(0x0DFFFFFF),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 9,
            child: eventCardImage(event.getImageURL()),
          ),
          Expanded(
            flex: 5,
            child: eventCardTray(
                event.getName(), event.getVenueName(), event.getDate()),
          ),
        ],
      ),
    ),
  );
}

Widget eventCardImage(String url) {
  return FittedBox(
    fit: BoxFit.cover,
    child: Image.network(url),
  );
}

Widget eventCardTray(String eventName, String venueName, DateTime date) {
  return Stack(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 30,
            child: eventCardTrayField(eventName, venueName, date),
          ),
        ],
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: eventCardTrayBookmark(),
      ),
    ],
  );
}

Widget eventCardTrayField(String eventName, String venueName, DateTime date) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Expanded(
        flex: 2,
        child: Container(),
      ),
      Expanded(
        flex: 7,
        child: eventCardTrayTitle(eventName),
      ),
      Expanded(
        flex: 5,
        child: eventCardTraySubtitle(venueName),
      ),
      Expanded(
        flex: 5,
        child: eventCardTraySubtitle(
          DateFormat('MMMMEEEEd').format(date),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(),
      ),
    ],
  );
}

Widget eventCardTrayBookmark() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Expanded(
        flex: 10,
        child: Container(),
      ),
      Expanded(
        flex: 9,
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0, right: 5.0),
            child: Icon(
              Icons.bookmark_border,
              color: Color(0x99FFFFFF),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget eventCardTrayTitle(String title) {
  return FittedBox(
    fit: BoxFit.fitHeight,
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 1.0, bottom: 1.0),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
          color: Color(0xFAFFFFFF),
        ),
      ),
    ),
  );
}

Widget eventCardTraySubtitle(String subtitle) {
  return FittedBox(
    fit: BoxFit.fitHeight,
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 1.0, bottom: 1.0),
      child: Text(
        subtitle,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
          color: Color(0x99FFFFFF),
        ),
      ),
    ),
  );
}
