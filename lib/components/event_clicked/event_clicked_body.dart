import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/event_page_bloc.dart';
import 'package:project_fomo/components/event_clicked/event_header.dart';
import 'package:project_fomo/components/event_clicked/info_line.dart';
import 'package:project_fomo/components/event_clicked/output_link.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

const double leftTitlePadding = 15.0;

class EventPageBody extends StatefulWidget {
  @override
  _EventPageBodyState createState() => _EventPageBodyState();
}

class _EventPageBodyState extends State<EventPageBody> {
  EventPageBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<EventPageBloc>(context, listen: false);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
          stream: _bloc.event,
          builder: (context, AsyncSnapshot<Event> eventSnapshot) {
            if (!eventSnapshot.hasData) return Container();
            Event event = eventSnapshot.data;
            print(event.genres);
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  EventHeader(imageURL: event.imageUrl, eventName: event.name),
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
                                event.description,
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
                              content: event.date,
                            ),
                            InfoLine(
                              type: 'Genre(s):',
                              content: event.genres.join(', '),
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
                    url: "formely the variable \"apple url\"",
                    displayIcon: Icons.gps_fixed,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
