import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/event.dart';

class EventService {
  final String _userId;

  EventService(this._userId);

  Future<Map<String, List<Event>>> getEventsByCategory() async {
    Map<String, List<Event>> categories = Map<String, List<Event>>();
    categories.addAll(await _getTaggedEventsByCategory());
    categories['upcoming'] = await _getUpcomingEvents(6);
    return categories;
  }

  Future<Map<String, List<Event>>> _getTaggedEventsByCategory() async {
    return Firestore.instance
        .collection('tags')
        .document('tags')
        .get()
        .then((DocumentSnapshot ds) {
      return _fetchTaggedEventsByCategory(ds.data);
    });
  }

  Future<Map<String, List<Event>>> _fetchTaggedEventsByCategory(
      Map<String, dynamic> tags) async {
    Map<String, List<Event>> categories = Map<String, List<Event>>();
    for (String tag in tags.keys) {
      categories[tag] = List<Event>();
      await Firestore.instance
          .collection('events')
          .where(FieldPath.documentId, whereIn: tags[tag])
          .getDocuments()
          .then((QuerySnapshot qs) {
        for (DocumentSnapshot ds in qs.documents) {
          Event event = Event.fromDocSnapshot(ds);
          categories[tag].add(event);
        }
      });
    }
    return categories;
  }

  Future<List<Event>> _getUpcomingEvents(int maxEvents) async {
    List<Event> events = [];
    String dateString = DateTime.now().toString().split(
        ' ')[0]; // This string is just the year, month, and day. Not the time
    await Firestore.instance
        .collection('events')
        .where('date', isGreaterThanOrEqualTo: dateString)
        .limit(maxEvents)
        .orderBy('date', descending: false)
        .getDocuments()
        .then((QuerySnapshot qs) {
      for (DocumentSnapshot ds in qs.documents) {
        Event event = Event.fromDocSnapshot(ds);
        events.add(event);
      }
    });
    return events;
  }
}
