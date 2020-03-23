import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/event.dart';

class EventService {
  final String _userId;

  EventService(this._userId);

  Future<Map<String, List<Event>>> getEventCategories() async {
    return Firestore.instance
        .collection('tags')
        .document('tags')
        .get()
        .then((DocumentSnapshot ds) {
      print(ds.data);
      return getCategories(ds.data);
    });
  }

  Future<Map<String, List<Event>>> getCategories(
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
}
