import 'package:flutter/material.dart';
import 'package:project_fomo/components/event_page/event_header.dart';
import 'package:project_fomo/components/event_page/info_line.dart';
import 'package:project_fomo/components/event_page/output_link.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/models/event.dart';

class EventPage extends StatelessWidget {
  static const String pageRoute = '/event-page';
  final Event event;

  EventPage({@required this.event});

  @override
  Widget build(BuildContext context) {
    final String appleUrl = 'https://maps.apple.com/?q=33.7573,-84.3963';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EventHeader(
              imageURL: event.imageUrl,
              eventName: event.name,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: AppColor.gradient,
                    )),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Future friend work here',
                      style: TextStyle(
                        fontFamily: AppFontFamily.family,
                        color: AppTextColor.mediumEmphasis,
                        fontSize: AppFontSize.size18,
                        fontWeight: AppFontWeight.normal,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFF343434)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF343434),
                      ),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          event.description ?? "No description",
                          style: TextStyle(
                            fontFamily: AppFontFamily.family,
                            fontSize: AppFontSize.size18,
                            fontWeight: AppFontWeight.normal,
                          ),
                        ),
                      ),
                      InfoLine(
                        type: 'Location:',
                        content: event.venueName,
                      ),
                      InfoLine(
                        type: 'Time:',
                        content: event.dateTime.hour.toString(),
                      ),
                      InfoLine(
                        type: 'Genre(s):',
                        content: [event.genre, event.subGenre].join(','),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            OutputLink(
              title: 'Get Tickets',
              url: event.ticketUrl,
              displayIcon: Icons.receipt,
            ),
            OutputLink(
              title: 'Get Directions',
              url: appleUrl,
              displayIcon: Icons.gps_fixed,
            ),
          ],
        ),
      ),
    );
  }
}
