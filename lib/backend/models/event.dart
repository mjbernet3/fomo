import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String _title;
  String _venue;
  DateTime _date;
  String _imageUrl;

  Event({String title, String venue, DateTime date, String imageUrl}) {
    this._title = title;
    this._venue = venue;
    this._date = date;
    this._imageUrl = imageUrl;
  }

  Event.fromDoc(DocumentSnapshot doc) {
    this._title = doc.data['eventName'];
    this._venue = doc.data['venueName'];
    this._date = DateTime.parse(doc.data['date']);
    this._imageUrl = doc.data['image'];
  }

  String get title {
    return _title;
  }

  String get venue {
    return _venue;
  }

  DateTime get date {
    return _date;
  }

  String get imageUrl {
    return _imageUrl;
  }
}
