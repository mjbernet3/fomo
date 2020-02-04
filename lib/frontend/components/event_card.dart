import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_fomo/backend/models/event.dart';

const double cardBorderRadius = 8.0;

const double cardFieldPadding = 6.0;
const double cardFieldSpacing = 0.5;
const int cardTitleFlex = 7;
const int cardSubtitleFlex = 5;

const double cardBookmarkPadding = 6.0;
const int cardBookmarkFlex = 5;
const int cardBookmarkSpacerFlex = 4;

const Color cardTrayColor = Color(0x0DFFFFFF);
const Color cardTitleColor = Color(0xFAFFFFFF);
const Color cardSubtitleColor = Color(0x99FFFFFF);
const Color cardBookmarkColor = cardSubtitleColor;

class EventCard extends StatelessWidget {
  final Event event;

  EventCard(this.event);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(cardBorderRadius)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: cardTrayColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            eventCardImage(event.imageUrl),
            eventCardTray(event.title, event.venue, event.date),
          ],
        ),
      ),
    );
  }
}

Widget eventCardImage(String url) {
  return Expanded(
    flex: 9,
    child: FittedBox(
      fit: BoxFit.cover,
      child: Image.network(url),
    ),
  );
}

Widget eventCardTray(String title, String venue, DateTime date) {
  return Expanded(
    flex: 5,
    child: Row(
      children: <Widget>[
        eventCardField(title, venue, date),
        eventCardTrayBookmark(),
      ],
    ),
  );
}

Widget eventCardField(String title, String venue, DateTime date) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(cardFieldPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          eventCardTitle(title),
          eventCardSubtitle(venue),
          eventCardSubtitle(DateFormat('MMMMEEEEd').format(date)),
        ],
      ),
    ),
  );
}

Widget eventCardTitle(String title) {
  return Expanded(
    flex: cardTitleFlex,
    child: FittedBox(
      fit: BoxFit.fitHeight,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
          color: cardTitleColor,
        ),
      ),
    ),
  );
}

Widget eventCardSubtitle(String subtitle) {
  return Expanded(
    flex: cardSubtitleFlex,
    child: FittedBox(
      fit: BoxFit.fitHeight,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: cardFieldSpacing),
        child: Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w400,
            color: cardSubtitleColor,
          ),
        ),
      ),
    ),
  );
}

Widget eventCardTrayBookmark() {
  return Column(
    children: <Widget>[
      Expanded(
        flex: cardBookmarkSpacerFlex,
        child: Container(),
      ),
      Expanded(
        flex: cardBookmarkFlex,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: cardBookmarkPadding,
              right: cardBookmarkPadding,
            ),
            child: Icon(
              Icons.bookmark_border,
              color: cardBookmarkColor,
            ),
          ),
        ),
      ),
    ],
  );
}
