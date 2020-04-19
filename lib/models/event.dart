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
    this.genre,
    this.subGenre,
    this.goingCount,
    this.interestedCount,
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
      goingCount: event['goingCount'],
      interestedCount: event['interestedCount'],
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
}
