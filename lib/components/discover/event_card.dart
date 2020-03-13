import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/pages/event_page.dart';

class SmallEventCard extends StatelessWidget {
  final Event event;

  SmallEventCard({this.event});

  static const TextStyle eventName = TextStyle(
    fontFamily: AppFontFamily.family,
    fontSize: AppFontSize.size16,
    color: AppTextColor.title,
  );

  static const TextStyle eventSubText = TextStyle(
    fontFamily: AppFontFamily.family,
    fontSize: AppFontSize.size14,
    color: AppTextColor.mediumEmphasis,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => EventPage(event: this.event),
          )
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColor.dp3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(event.imageUrl),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "",
                              style: eventName,
                            ),
                            Text(
                              "",
                              style: eventName,
                            ),
                          ],
                        ),
                        Text(
                          event.name,
                          style: eventName,
                          maxLines: 2,
                        ),
                      ],
                    ),
                    Text(
                      event.venueName,
                      style: eventSubText,
                    ),
                    Text(
                      event.date,
                      style: eventSubText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
