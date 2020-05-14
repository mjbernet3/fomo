import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id;
  String address;
  String name;
  String imageUrl;
  Map location;
  DateTime dateTime;
  String ticketUrl;
  String venueName;
  String description;
  List usersGoing;
  List usersInterested;
  String genre;
  String subGenre;

  Event({
    this.id,
    this.address,
    this.dateTime,
    this.name,
    this.imageUrl,
    this.location,
    this.ticketUrl,
    this.venueName,
    this.description,
    this.usersGoing,
    this.usersInterested,
    this.genre,
    this.subGenre,
  });

  factory Event.fromDocSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> event = snapshot.data;

    return Event(
      id: snapshot.documentID,
      name: event['name'],
      venueName: event['venueName'],
      address: event['address'],
      dateTime: DateTime.parse(event['dateTime']),
      description: event['description'],
      genre: event['genre'],
      subGenre: event['subGenre'],
      imageUrl: event['imageUrl'],
      location: event['location'],
      ticketUrl: event['ticketUrl'],
      usersGoing: event['usersGoing'],
      usersInterested: event['usersInterested'],
    );
  }

  factory Event.fromAlgoliaSnapshot(AlgoliaObjectSnapshot snapshot) {
    Map<String, dynamic> event = snapshot.data;

    return Event(
      id: snapshot.objectID,
      name: event['name'],
      venueName: event['venueName'],
      address: event['address'],
      dateTime: DateTime.parse(event['dateTime']),
      description: event['description'],
      genre: event['genre'],
      subGenre: event['subGenre'],
      imageUrl: event['imageUrl'],
      location: event['location'],
      ticketUrl: event['ticketUrl'],
    );
  }

  String getDateTimeString() {
    if (dateTime == null) {
      return "";
    }
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    String month = months[dateTime.month - 1];

    List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    String weekday = weekdays[dateTime.weekday - 1];

    String day = dateTime.day.toString();
    String hour;
    String tod;

    // Someone with more time could do this more cleverly with % operator
    if (dateTime.hour == 0) {
      hour = "12";
      tod = "AM";
    } else if (dateTime.hour <= 11) {
      hour = dateTime.hour.toString();
      tod = 'AM';
    } else if (dateTime.hour == 12) {
      hour = "12";
      tod = "PM";
    } else {
      hour = (dateTime.hour - 12).toString();
      tod = "PM";
    }
    String minute = dateTime.minute.toString();
    if (minute.length == 1) {
      minute = "0$minute";
    }
    return "$weekday, $month $day, $hour:$minute $tod";
  }
}
