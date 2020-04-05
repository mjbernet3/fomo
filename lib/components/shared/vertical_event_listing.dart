import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/list_event_card.dart';
import 'package:project_fomo/models/event.dart';

class VerticalEventListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return ListEventCard(
            event: Event(
              name: 'Hedonistas',
              venueName: 'Center Stage',
              date: 'Friday, January 19th',
              imageUrl:
                  'https://s1.ticketm.net/dam/a/c40/e0f4dedd-b435-4b8b-8fd0-e73e47e93c40_851341_CUSTOM.jpg',
            ),
          );
        },
      ),
    );
  }
}
