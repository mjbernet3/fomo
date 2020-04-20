import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/list_event_card.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/services/event_service.dart';

class FutureCardListing extends StatelessWidget {
  final List<dynamic> events;

  const FutureCardListing({this.events});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return FutureBuilder(
              future: EventService.getEventFromDocRef(events[index]),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                return ListEventCard(
                  event: snapshot.data,
                );
              });
        },
      ),
    );
  }
}
