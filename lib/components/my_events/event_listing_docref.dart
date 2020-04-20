import 'package:flutter/material.dart';
import 'package:project_fomo/components/my_events//event_card_docref.dart';
import 'package:project_fomo/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:provider/provider.dart';

import '../../services/event_service.dart';

class VerticalReferenceListing extends StatelessWidget {
  final List<DocumentReference> events;

  const VerticalReferenceListing({this.events});

  @override
  Widget build(BuildContext context) {

    final EventService _userService =
      Provider.of<EventService>(context, listen: false);


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
