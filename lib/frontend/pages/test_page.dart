import 'package:flutter/material.dart';
import 'package:project_fomo/backend/models/event.dart';
import 'package:project_fomo/backend/services/data_store.dart';
import 'package:project_fomo/frontend/components/event_card.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder(
            stream: DataStore.getFeaturedEventsStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Event event = snapshot.data.map((event) => event).toList()[0];
                return SizedBox(
                  height: 175,
                  width: 90,
                  child: EventCard(event),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
