import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/utils/structures/response.dart';

class EventService {
  final CollectionReference _eventCollection =
      Firestore.instance.collection('events');

  Future<Response> getAllEvents() async {
    try {
      QuerySnapshot eventSnapshot = await _eventCollection.getDocuments();

      List<Event> events =
          eventSnapshot.documents.map((DocumentSnapshot document) {
        return Event.fromDocSnapshot(document);
      }).toList();

      return Response(status: Status.SUCCESS, data: events);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  DocumentReference getDocumentReference(String eventId) {
    return _eventCollection.document(eventId);
  }

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

  static Future<void> addUserToInterested(String eventId, String userId) async {
    return _getInterestedUsers(eventId).then((List<dynamic> interestedUsers) {
      if (interestedUsers.contains(userId)) {
        return Future.error(
            "User $userId is alread interested in event $eventId");
      }
      interestedUsers.add(userId);
      return _setInterestedUsers(eventId, interestedUsers);
    }).catchError((error) => Future.error(error));
  }

  static Future<void> removeUserFromInterested(
      String eventId, String userId) async {
    return _getInterestedUsers(eventId).then((List<dynamic> interestedUsers) {
      if (!interestedUsers.contains(userId)) {
        return Future.error("User $userId is not interested to event $eventId");
      }
      interestedUsers.remove(userId);
      return _setInterestedUsers(eventId, interestedUsers);
    }).catchError((error) => Future.error(error));
  }

  // Large security flaw in fetching userIds
  static Future<List<dynamic>> _getInterestedUsers(String eventId) async {
    return Firestore.instance
        .collection('events')
        .document(eventId)
        .get()
        .then((DocumentSnapshot ds) {
      List<dynamic> interestedUsers = ds.data['usersInterested'];
      return interestedUsers;
    }).catchError((error) => Future.error(error));
  }

  // array adds are unsafe in multi-user database
  static Future<void> _setInterestedUsers(
      String eventId, List<dynamic> newInterestedUsers) async {
    return Firestore.instance
        .collection('events')
        .document(eventId)
        .updateData({'usersInterested': newInterestedUsers});
  }
}
