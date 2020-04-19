import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/event.dart';

class EventService {
  DocumentSnapshot lastDocument;

  // TODO: Change to solution that uses one query to get events
  Future<Map<String, List<Event>>> getEventsByCategory() async {
    Map<String, List<Event>> categories = Map<String, List<Event>>();
    categories['featured'] = await getTaggedEvents('featured');
    categories['popular'] = await getPopularEvents();
    categories['upcoming'] = await getUpcomingEvents();
    return categories;
  }

  Future<List<Event>> getPopularEvents(
      {DocumentSnapshot startAfter, int limit}) async {
    Query query = _getPopularQuery(startAfter, limit: limit);
    return _queryEvents(query);
  }

  Future<List<Event>> getUpcomingEvents(
      {DocumentSnapshot startAfter, int limit}) async {
    Query query = _getUpcomingQuery(startAfter, limit: limit);
    return _queryEvents(query);
  }

  Future<List<Event>> getTaggedEvents(String tag, {int limit}) async {
    Query query = _getTaggedQuery(tag, limit: limit);
    return _queryEvents(query);
  }

  Future<List<Event>> _queryEvents(Query query) async {
    List<Event> events = [];
    await query.getDocuments().then((QuerySnapshot qs) {
      for (DocumentSnapshot ds in qs.documents) {
        Event event = Event.fromDocSnapshot(ds);
        events.add(event);
        lastDocument = ds;
      }
    });
    return events;
  }

  Query _getPopularQuery(DocumentSnapshot lastDocument, {int limit: 10}) {
    if (lastDocument == null) {
      return Firestore.instance
          .collection('events')
          .orderBy('goingCount', descending: true)
          .limit(limit);
    }
    int lastNumGoing = lastDocument.data['goingCount'];
    return Firestore.instance
        .collection('events')
        .orderBy('goingCount', descending: true)
        .startAfter([
      lastNumGoing,
    ]).limit(limit);
  }

  Query _getUpcomingQuery(DocumentSnapshot lastDocument, {int limit: 10}) {
    if (lastDocument == null) {
      return Firestore.instance
          .collection('events')
          .orderBy('dateTime', descending: false)
          .limit(limit);
    }
    String lastDateTime = lastDocument.data['dateTime'];
    return Firestore.instance
        .collection('events')
        .orderBy('dateTime', descending: false)
        .startAfter([
      lastDateTime,
    ]).limit(limit);
  }

  Query _getTaggedQuery(String tag, {int limit}) {
    return Firestore.instance
        .collection('events')
        .where('tags', arrayContains: tag)
        .limit(limit);
  }
}
