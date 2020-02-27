import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/event_page/event_header.dart';
import 'package:project_fomo/frontend/components/event_page/info_line.dart';
import 'package:project_fomo/frontend/components/event_page/output_link.dart';
import 'package:project_fomo/style.dart';

Event myEvent = Event(
    name: 'My Event 4',
    venueName: 'PIKE',
    description: "This event will be a lot of fun",
    date: "Thurs, January 13th",
    genres: ['Pop'],
    ticketUrl: 'https://www1.ticketmaster.com/harry-styles-love-on-tour/event/0E00576BA4553316',
    location: {'Latitude': '33.7573', 'Longitude': '-84.3963'},
    imageUrl: 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6358/6358944_sd.jpg;maxHeight=640;maxWidth=550');

class EventPage extends StatelessWidget {

  static const String pageRoute = '/event-page';
  final Event event;

  EventPage({@required this.event});

//  checkEvent() async {
//    print(event);
//    print(event.name);
//    print(event.venueName);
//    print(event.description);
//    print(event.date);
//    print(event.genres);
//    print(event.ticketUrl);
//    print(event.location);
//    print(event.imageUrl);
//  }


  @override
  Widget build(BuildContext context) {


//    checkEvent();

//    final num latitude = event.location['Latitude'];
//    final num longitude = event.location['Longitude'];
//    final String appleUrl = 'https://maps.apple.com/?q=$latitude,$longitude';

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
            EventHeader(imageURL: myEvent.imageUrl, eventName: myEvent.name),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: AppColor.gradient,
                    )
                ),
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
                          myEvent.description,
                          style: TextStyle(
                            fontFamily: AppFontFamily.family,
                            fontSize: AppFontSize.size18,
                            fontWeight: AppFontWeight.normal,
                          ),
                        ),
                      ),
                      InfoLine(
                        type: 'Location:',
                        content: myEvent.venueName,
                      ),
                      InfoLine(
                        type: 'Time:',
                        content: myEvent.date,
                      ),
                      InfoLine(
                        type: 'Genre(s):',
                        content: myEvent.genres.join(', '),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            OutputLink(
              title: 'Get Tickets',
              url: myEvent.ticketUrl,
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
