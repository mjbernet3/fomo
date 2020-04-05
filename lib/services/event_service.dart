import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/event.dart';

class EventService {
  final String _userId;

  EventService(this._userId);

  Future<Map<String, List<Event>>> getEventsByCategory() async {
    Map<String, List<Event>> categories = Map<String, List<Event>>();
    categories['featured'] = await getTaggedEvents('featured');
    categories['popular'] = await getPopularEvents();
    categories['upcoming'] = await getUpcomingEvents();
    print(categories);
    return categories;
  }

  Future<List<Event>> getPopularEvents({Event startFrom, int limit}) async {
    Query query = _getPopularQuery(startFrom, limit: limit);
    return _queryEvents(query);
  }

  Future<List<Event>> getUpcomingEvents({Event startFrom, int limit}) async {
    Query query = _getUpcomingQuery(startFrom, limit: limit);
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
      }
    });
    print(events);
    return events;
  }

  Query _getPopularQuery(Event lastEvent, {int limit: 10}) {
    if (lastEvent == null) {
      return Firestore.instance
          .collection('events')
          .orderBy('goingCount', descending: true)
          .orderBy('id', descending: false)
          .limit(limit);
    }
    int lastNumGoing = lastEvent.numGoing;
    String lastId = lastEvent.id;
    return Firestore.instance
        .collection('events')
        .orderBy('goingCount', descending: true)
        .orderBy('id', descending: false)
        .startAfter([
      lastNumGoing,
      lastId,
    ]).limit(limit);
  }

  Query _getUpcomingQuery(Event lastEvent, {int limit: 10}) {
    if (lastEvent == null) {
      return Firestore.instance
          .collection('events')
          .orderBy('dateTime', descending: false)
          .orderBy('id', descending: false)
          .limit(limit);
    }
    String lastDate = lastEvent.date;
    String lastTime = lastEvent.time;
    String lastId = lastEvent.id;
    return Firestore.instance
        .collection('events')
        .orderBy('dateTime', descending: false)
        .orderBy('id', descending: false)
        .startAfter([
      lastDate,
      lastTime,
      lastId,
    ]).limit(limit);
  }

  Query _getTaggedQuery(String tag, {int limit}) {
    return Firestore.instance
        .collection('events')
        .where('tags', arrayContains: tag)
        .orderBy('id', descending: false)
        .limit(limit);
  }
}
