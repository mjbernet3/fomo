import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/user_service.dart';

class EventService {
  DocumentSnapshot lastDocument;

  // TODO: Change to solution that uses one query to get events
  Future<Map<String, List<Event>>> getEventsByCategory(
      UserService userService) async {
    Map<String, List<Event>> categories = Map<String, List<Event>>();
    categories['featured'] = await getFeaturedEvents();
    categories['popular'] = await getPopularEvents();
    categories['upcoming'] = await getUpcomingEvents();
    categories['friends'] = await getFriendEvents(userService: userService);
    return categories;
  }

  Future<List<Event>> getFriendEvents(
      {int limit, @required UserService userService}) async {
    List<Event> events;
    UserData userData = await userService.userData.first;
    List<dynamic> friends = userData.friends;
    friends.forEach((userName) async {
      try {
        Event topEvent = await _getTopEventOfUser(userName);
        events.add(topEvent);
      } catch (error) {
        print(
            "Failed to find top event of user $userName"); // Bad practice to swallow error, but error does not impact logic
      }
    });
    if (events == null) {
      return [];
    }
    if (limit < events.length) {
      return events.sublist(0, limit);
    }
    return events;
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

  Future<List<Event>> getFeaturedEvents({int limit}) async {
    Query query = _getFeaturedQuery(limit: limit);
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

  Query _getFeaturedQuery({int limit}) {
    return Firestore.instance
        .collection('events')
        .where('featured', isEqualTo: true)
        .limit(limit);
  }

  Future<Event> _getTopEventOfUser(String userName) async {
    return UserService.getUserDataFromUserName(userName)
        .then((UserData userData) {
      String eventId;
      if (userData.going.length > 0) {
        eventId = userData.going[0];
      } else if (userData.interested.length > 0) {
        eventId = userData.interested[0];
      } else {
        throw Future.error("could not find top event of user $userName");
      }
      return _getEventById(eventId);
    }).catchError((error) => Future.error(error));
  }

  Future<Event> _getEventById(String eventId) async {
    return Firestore.instance
        .collection('events')
        .document(eventId)
        .get()
        .then((DocumentSnapshot ds) {
      return Event.fromDocSnapshot(ds);
    }).catchError((error) => Future.error(error));
  }
}
