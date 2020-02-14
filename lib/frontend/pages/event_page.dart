import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/event_page/event_header.dart';
import 'package:project_fomo/frontend/components/event_page/infoLine.dart';
import 'package:project_fomo/frontend/components/event_page/output_link.dart';
import 'package:project_fomo/style.dart';

class EventPage extends StatelessWidget {
  static const String pageRoute = '/event-page';
  static const String imageURL =
      'https://s1.ticketm.net/dam/a/987/76ff7a29-6b21-4ac5-bdf3-d7268760e987_1206471_RETINA_LANDSCAPE_16_9.jpg';
  static const String artistName = 'Harry Styles';
  static const String description =
      'Harry Styles announced a 2020 world tour, \‘Love On Tour,\' in support of his upcoming album Fine Line. The extensive run of shows begins in April in the UK and travels across Europe and North America before concluding in Mexico in October.';
  static const String location = 'State Farm Arena';
  static const String date = 'Wednesday, Jul 29 at 8:00 pm';
  static const String genre = 'Pop';
  static const String ticketURL =
      'https://www1.ticketmaster.com/harry-styles-love-on-tour/event/0E00576BA4553316';
  static var coordinates = {'Latitude': '33.7573', 'Longitude': '-84.3963'};
  static const String locationURL =
      'https://www.google.com/maps/search/?api=1&query=33.7573,-84.3963';
  static const String appleURL = 'https://maps.apple.com/?q=33.7573,-84.3963';

  @override
  Widget build(BuildContext context) {
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
            EventHeader(imageURL: imageURL, artistName: artistName),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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
                            bottom: BorderSide(color: Color(0xFF343434)))),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            description,
                            style: TextStyle(
                              fontFamily: AppFontFamily.family,
                              fontSize: AppFontSize.size18,
                              fontWeight: AppFontWeight.normal,
                            ),
                          ),
                        ),
                        InfoLine(
                          type: 'Location:',
                          content: location,
                        ),
                        InfoLine(
                          type: 'Time:',
                          content: date,
                        ),
                        InfoLine(
                          type: 'Genre(s):',
                          content: genre,
                        ),
                      ],
                    ),
                  ),
                ]),
            OutputLink(
              title: 'Get Tickets',
              url: ticketURL,
              urlIcon: Icons.open_in_new,
              displayIcon: Icons.receipt,
            ),
            OutputLink(
              title: 'Get Directions',
              url: appleURL,
              urlIcon: Icons.open_in_new,
              displayIcon: Icons.gps_fixed,
            ),
          ],
        ),
      ),
    );
  }
}
