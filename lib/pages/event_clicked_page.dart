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
                EventHeader(event: _event,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: AppColor.gradient,
                      ),
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
                              _event.description != null
                                  ? _event.description
                                  : "This event has no description.",
                              style: TextStyle(
                                fontFamily: AppFontFamily.family,
                                fontSize: AppFontSize.size18,
                                fontWeight: AppFontWeight.normal,
                              ),
                            ),
                          ),
                          InfoLine(
                            type: 'Location:',
                            content: _event.venueName,
                          ),
                          InfoLine(
                            type: 'Time:',
                            content: _event.dateTime.toIso8601String(),
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
                  url: "formely the variable \"apple url\"",
                  displayIcon: Icons.gps_fixed,
                ),
              ],
            ),
          ),
        ));
  }
}
