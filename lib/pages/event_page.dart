import 'package:flutter/material.dart';
import 'package:project_fomo/components/event_page/event_page_body.dart';
import 'package:project_fomo/models/event.dart';

class EventPage extends StatelessWidget {
  static const String pageRoute = '/event-page';
  final Event event;

  EventPage({@required this.event});

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
      body: EventPageBody(),
    );
  }
}
