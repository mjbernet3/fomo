import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/list_event_card.dart';
import 'package:project_fomo/models/event.dart';

class VerticalEventListing extends StatelessWidget {
  final List<Event> events;

  const VerticalEventListing({this.events});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListEventCard(
            event: events[index],
          );
        },
      ),
    );
  }
}
