import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String _name;
  String _venueName;
  DateTime _date;
  String _imageURL;

  Event(this._name, this._venueName, this._date, this._imageURL);

  Event.fromDoc(DocumentSnapshot doc) {
    this._name = doc.data['eventName'];
    this._venueName = doc.data['venueName'];
    this._date = DateTime.parse(doc.data['date']);
    this._imageURL = doc.data['image'];
  }

  String getName() {
    return _name;
  }

  String getVenueName() {
    return _venueName;
  }

  DateTime getDate() {
    return _date;
  }

  String getImageURL() {
    return _imageURL;
  }
}
