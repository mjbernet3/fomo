import 'package:flutter/material.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/pages/event_page.dart';

class ListEventCard extends StatelessWidget {
  final String eventId;

  ListEventCard({this.eventId});

  @override
  Widget build(BuildContext context) {
    final EventService _eventService =
    Provider.of<EventService>(context, listen: false);
    return StreamBuilder (
        stream: _eventService.getEvent(eventId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingIndicator();
          }

          final Event _eventData = snapshot.data;

          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventPage(event: _eventData,))
                );
              },
              child: Container(
                height: 100.0,
                padding: EdgeInsets.fromLTRB(15.0, 7.5, 15.0, 7.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          _eventData.imageUrl,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: 10.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _eventData.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppTextColor.highEmphasis,
                                fontSize: AppFontSize.size18,
                                fontFamily: AppFontFamily.family,
                                fontWeight: AppFontWeight.normal,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _eventData.venueName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppTextColor.mediumEmphasis,
                                    fontSize: AppFontSize.size14,
                                    fontFamily: AppFontFamily.family,
                                  ),
                                ),
                                Text(
                                  '${_eventData.dateTime.month}/${_eventData.dateTime.day}/${_eventData.dateTime.year}',
                                  style: TextStyle(
                                    color: AppTextColor.mediumEmphasis,
                                    fontSize: AppFontSize.size14,
                                    fontFamily: AppFontFamily.family,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppTextColor.mediumEmphasis,
                      ),
                    ),
                  ],
                ),
              ),
          );
        }
    );
  }
}
