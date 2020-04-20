import 'package:flutter/material.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/pages/event_clicked_page.dart';
import 'package:project_fomo/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';

class ListEventCard extends StatelessWidget {
  final DocumentReference event;

  ListEventCard({this.event});

  @override
  Widget build(BuildContext context) {

    Future<DocumentSnapshot> _eventDoc = event.get();

    return FutureBuilder<DocumentSnapshot>(
      future: _eventDoc,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingIndicator();
          }

          DocumentSnapshot _eventData = snapshot.data;
          Event event = Event.fromDocSnapshot(_eventData);

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, EventClickedPage.pageRoute,
                  arguments: event);
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
                        event.imageUrl,
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
                            event.name,
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
                                event.venueName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppTextColor.mediumEmphasis,
                                  fontSize: AppFontSize.size14,
                                  fontFamily: AppFontFamily.family,
                                ),
                              ),
                              Text(
                                '${event.dateTime}}',
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
        },

    );
  }
}
