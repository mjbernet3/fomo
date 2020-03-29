import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id;
  String address;
  String date;
  String name;
  String imageUrl;
  Map location;
  String time;
  String ticketUrl;
  String venueName;
  String description;
  List usersGoing;
  List usersInterested;
  List genres;
  int numGoing;

  Event({
    this.id,
    this.address,
    this.date,
    this.name,
    this.imageUrl,
    this.location,
    this.time,
    this.ticketUrl,
    this.venueName,
    this.description,
    this.usersGoing,
    this.usersInterested,
    this.genres,
    this.numGoing,
  });

  factory Event.fromDocSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> event = snapshot.data;

    return Event(
      //id: snapshot.documentID,
      id: event['id'],
      address: event['address'],
      date: event['date'],
      name: event['name'],
      imageUrl: event['imageUrl'],
      location: event['location'],
      time: event['time'],
      ticketUrl: event['ticketUrl'],
      venueName: event['venueName'],
      description: event['description'],
      usersGoing: event['usersGoing'],
      usersInterested: event['usersInterested'],
      genres: event['genres'],
      numGoing: event['numGoing'],
    );
  }
}
