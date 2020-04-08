import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id;
  String address;
  String name;
  String imageUrl;
  Map location;
  String dateTime;
  String ticketUrl;
  String venueName;
  String description;
  List usersGoing;
  List usersInterested;
  List genres;
  int goingCount;
  int interestedCount;

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
    this.genres,
    this.goingCount,
    this.interestedCount,
  });

  factory Event.fromDocSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> event = snapshot.data;

    return Event(
        id: event['id'],
        address: event['address'],
        dateTime: event['dateTime'],
        name: event['name'],
        imageUrl: event['imageUrl'],
        location: event['location'],
        ticketUrl: event['ticketUrl'],
        venueName: event['venueName'],
        description: event['description'],
        usersGoing: event['usersGoing'],
        usersInterested: event['usersInterested'],
        genres: event['genres'],
        goingCount: event['goingCount'],
        interestedCount: event['interestedCount']);
  }
}
