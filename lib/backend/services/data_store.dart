import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/backend/models/event.dart';

const String eventsCollection = 'eventsx';

Future<List<Event>> getEvents(String key, String collection,
    {int limit: 5}) async {
  QuerySnapshot querySnapshot = await Firestore.instance
      .collection(collection)
      .where(key, isEqualTo: true)
      .limit(limit)
      .getDocuments();
  return querySnapshot.documents
      .map<Event>((doc) => Event.fromDoc(doc))
      .toList();
}

class DataStore {
//  static Stream<Iterable<Event>> getFeaturedEvents() {
//    //TODO: Write feature finder
//    return Firestore.instance
//        .collection(eventsCollection)
//        .where('featured', isEqualTo: true)
//        .limit(5)
//        .snapshots()
//        .map<Iterable<Event>>((QuerySnapshot event) =>
//            event.documents.map((doc) => Event.fromDoc(doc)));
//  }

//  static Stream<Iterable<Event>> getUpcomingEvents() {
//    //TODO: Write upcoming finder
//    return Firestore.instance
//        .collection(eventsCollection)
//        .where('date', isGreaterThan: DateTime.now().toString())
//        .orderBy('date', descending: true)
//        .limit(5)
//        .snapshots()
//        .map<Iterable<Event>>((QuerySnapshot event) =>
//            event.documents.map((doc) => Event.fromDoc(doc)));
//  }
//
//  static Stream<Iterable<Event>> getPopularEvents() {
//    //TODO: Write popular finder
//    return Firestore.instance
//        .collection(eventsCollection)
//        .where('popular', isEqualTo: true)
//        .limit(5)
//        .snapshots()
//        .map<Iterable<Event>>((QuerySnapshot event) =>
//            event.documents.map((doc) => Event.fromDoc(doc)));
//  }
}
