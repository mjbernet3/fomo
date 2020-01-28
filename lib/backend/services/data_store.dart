import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/backend/models/event.dart';

const String eventsCollection = 'eventsx';

class DataStore {
  static Stream<Iterable<Event>> getFeaturedEventsStream() {
    //TODO: Write feature finder
    return Firestore.instance
        .collection(eventsCollection)
        .where('featured', isEqualTo: true)
        .limit(5)
        .snapshots()
        .map<Iterable<Event>>((QuerySnapshot event) =>
            event.documents.map((doc) => Event.fromDoc(doc)));
  }

  static Stream<Iterable<Event>> getUpcomingEventsStream() {
    //TODO: Write upcoming finder
    return Firestore.instance
        .collection(eventsCollection)
        .where('date', isGreaterThan: DateTime.now().toString())
        .orderBy('date', descending: true)
        .limit(5)
        .snapshots()
        .map<Iterable<Event>>((QuerySnapshot event) =>
            event.documents.map((doc) => Event.fromDoc(doc)));
  }

  static Stream<Iterable<Event>> getPopularEventsStream() {
    //TODO: Write popular finder
    return Firestore.instance
        .collection(eventsCollection)
        .where('popular', isEqualTo: true)
        .limit(5)
        .snapshots()
        .map<Iterable<Event>>((QuerySnapshot event) =>
            event.documents.map((doc) => Event.fromDoc(doc)));
  }
}
