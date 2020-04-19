import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/event.dart';

class EventService {
  DocumentSnapshot lastDocument;

  static Future<void> addUserToGoing(String eventId, String userId) async {
    return _getGoingUsers(eventId).then((List<dynamic> goingUsers) {
      if (goingUsers.contains(userId)) {
        return Future.error("User $userId is alread going to event $eventId");
      }
      goingUsers.add(userId);
      return _setGoingUsers(eventId, goingUsers);
    }).catchError((error) => Future.error(error));
  }

  static Future<void> removeUserFromGoing(String eventId, String userId) async {
    return _getGoingUsers(eventId).then((List<dynamic> goingUsers) {
      if (!goingUsers.contains(userId)) {
        return Future.error("User $userId is not going to event $eventId");
      }
      goingUsers.remove(userId);
      return _setGoingUsers(eventId, goingUsers);
    }).catchError((error) => Future.error(error));
  }

  // Large security flaw in fetching userIds
  static Future<List<dynamic>> _getGoingUsers(String eventId) async {
    return Firestore.instance
        .collection('events')
        .document(eventId)
        .get()
        .then((DocumentSnapshot ds) {
      List<dynamic> goingUsers = ds.data['usersGoing'];
      return goingUsers;
    }).catchError((error) => Future.error(error));
  }

  // array adds are unsafe in multi-user database
  static Future<void> _setGoingUsers(
      String eventId, List<dynamic> newGoingUsers) async {
    return Firestore.instance
        .collection('events')
        .document(eventId)
        .updateData({'usersGoing': newGoingUsers});
  }

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
