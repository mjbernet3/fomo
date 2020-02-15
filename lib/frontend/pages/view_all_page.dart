import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/frontend/components/shared/list_event_card.dart';
import 'package:project_fomo/style.dart';

class ViewAllPage extends StatelessWidget {
  static const String pageRoute = '/view-all';

  static final List<Event> testEvents = [
    Event(
        name: 'Hedonistas',
        venueName: 'Center Stage',
        date: 'Friday, January 19th',
        imageUrl:
            'https://s1.ticketm.net/dam/a/c40/e0f4dedd-b435-4b8b-8fd0-e73e47e93c40_851341_CUSTOM.jpg'),
    Event(
        name: 'Hedonistas',
        venueName: 'Center Stage',
        date: 'Friday, January 19th',
        imageUrl:
            'https://s1.ticketm.net/dam/a/c40/e0f4dedd-b435-4b8b-8fd0-e73e47e93c40_851341_CUSTOM.jpg'),
    Event(
        name: 'Hedonistas',
        venueName: 'Center Stage',
        date: 'Friday, January 19th',
        imageUrl:
            'https://s1.ticketm.net/dam/a/c40/e0f4dedd-b435-4b8b-8fd0-e73e47e93c40_851341_CUSTOM.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Popular',
          style: TextStyle(
            color: Colors.white,
            fontSize: AppFontSize.size22,
            fontFamily: AppFontFamily.family,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.red,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: testEvents.length,
          itemBuilder: (context, index) {
            return ListEventCard(
              event: testEvents[index],
            );
          },
        ),
      ),
    );
  }
}
