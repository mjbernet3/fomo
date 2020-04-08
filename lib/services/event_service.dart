import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/event.dart';

class EventService {
  final CollectionReference _eventCollection =
      Firestore.instance.collection('events');

  EventService();

  Future<List<Event>> getAllEvents() async {
    QuerySnapshot eventSnapshot = await _eventCollection.getDocuments();

    List<Event> events =
        eventSnapshot.documents.map((DocumentSnapshot document) {
      return Event.fromDocSnapshot(document);
    }).toList();

    return events;
  }

  Stream<QuerySnapshot> get events {
    return _eventCollection
        .snapshots();
  }

  Stream<Event> getEvent(String _eventId) {
    return _eventCollection
        .document(_eventId)
        .snapshots()
        .map((DocumentSnapshot snapshot) {
            return Event.fromDocSnapshot(snapshot);
        });
  }
}

