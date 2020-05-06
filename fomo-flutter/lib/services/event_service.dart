import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/utils/structures/response.dart';

class EventService {
  final CollectionReference _eventCollection =
      Firestore.instance.collection('events');

  final String _userId;

  EventService(this._userId);

  Stream<List<Event>> get allEvents {
    return _eventCollection.snapshots().map((QuerySnapshot query) => query
        .documents
        .map((DocumentSnapshot snapshot) => Event.fromDocSnapshot(snapshot))
        .toList());
  }

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

  // TODO: Utilize when user adds an event to going list
  Future<Response> setEventGoing(String eventId, bool isGoing) async {
    try {
      if (isGoing) {
        await _eventCollection.document(eventId).updateData({
          'usersGoing': FieldValue.arrayUnion([_userId])
        });
      } else {
        await _eventCollection.document(eventId).updateData({
          'usersGoing': FieldValue.arrayRemove([_userId])
        });
      }

      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  // TODO: Utilize when user adds an event to interested list
  Future<Response> setEventInterested(String eventId, bool isInterested) async {
    try {
      if (isInterested) {
        await _eventCollection.document(eventId).updateData({
          'usersInterested': FieldValue.arrayUnion([_userId])
        });
      } else {
        await _eventCollection.document(eventId).updateData({
          'usersInterested': FieldValue.arrayRemove([_userId])
        });
      }

      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }
}
