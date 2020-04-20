import 'package:flutter/material.dart';
import 'package:project_fomo/components/event_clicked/event_header.dart';
import 'package:project_fomo/components/event_clicked/info_line.dart';
import 'package:project_fomo/components/event_clicked/output_link.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/style.dart';

class EventClickedPage extends StatelessWidget {
  static const String pageRoute = '/event-page';

  @override
  Widget build(BuildContext context) {
    Event _event = ModalRoute.of(context).settings.arguments;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              EventHeader(imageURL: _event.imageUrl, eventName: _event.name),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF343434),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _event.description != null
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 25, right: 15, bottom: 15),
                                child: Text(
                                  _event.description,
                                  style: TextStyle(
                                    fontFamily: AppFontFamily.family,
                                    fontSize: AppFontSize.size18,
                                    fontWeight: AppFontWeight.normal,
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                        InfoLine(
                          type: 'Location:',
                          content: _event.venueName,
                        ),
                        InfoLine(
                          type: 'Time:',
                          content: _event.getDateTimeString(),
                        ),
                        InfoLine(
                          type: 'Genre(s):',
                          content: '${_event.genre}, ${_event.subGenre}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              OutputLink(
                title: 'Get Tickets',
                url: _event.ticketUrl,
                displayIcon: Icons.receipt,
              ),
              OutputLink(
                title: 'Get Directions',
                url: 'https://www.google.com/maps/search/?api=1&query=${_event.location['latitude']},${_event.location['longitude']}',
                displayIcon: Icons.gps_fixed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
