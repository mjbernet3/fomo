import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id;
  String name;
  String venueName;
  String address;
  DateTime dateTime;
  String description; // null if there is no description
  String genre;
  String subGenre;
  String imageUrl;
  Map location;
  String ticketUrl;
  List usersGoing;
  List usersInterested;
  int goingCount;
  int interestedCount;

  Event({
    this.id,
    this.name,
    this.venueName,
    this.address,
    this.dateTime,
    this.description,
    this.genre,
    this.subGenre,
    this.imageUrl,
    this.location,
    this.ticketUrl,
    this.usersGoing,
    this.usersInterested,
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
