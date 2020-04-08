import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/event_page_bloc.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/pages/event_clicked_page.dart';
import 'package:project_fomo/pages/event_page.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';
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
        Provider.of<EventPageBloc>(context, listen: false)
            .setPageEvent(event);
        Navigator.pushNamed(context, EventPage.pageRoute);
      }
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
                      event.dateTime.day.toString(),
                      style: eventSubText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
