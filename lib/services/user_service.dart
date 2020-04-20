import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:project_fomo/utils/structures/response.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class UserService {
  final CollectionReference _userDataCollection =
      Firestore.instance.collection('users');

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://fomo-d20a9.appspot.com');

  final String _userId;

  UserService(this._userId);

  Stream<UserData> get userData {
    return _userDataCollection
        .document(_userId)
        .snapshots()
        .map((DocumentSnapshot userDataSnap) {
      return UserData.fromDocSnap(userDataSnap);
    });
  }

  Stream<UserData> otherUserData(String id) {
    return _userDataCollection
        .document(id)
        .snapshots()
        .map((DocumentSnapshot userDataSnap) {
      return UserData.fromDocSnap(userDataSnap);
    });
  }

  Future<Response> updateName(String name) async {
    try {
      await _userDataCollection
          .document(_userId)
          .updateData({'displayName': name});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> updateLocation(bool data) async {
    try {
      await _userDataCollection
          .document(_userId)
          .updateData({'shouldLocate': data});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> uploadImage(File image) async {
    try {
      String _storagePath = "images/$_userId.jpg";
      await _storage.ref().child(_storagePath).putFile(image).onComplete;
      String _downloadUrl =
          await _storage.ref().child(_storagePath).getDownloadURL();
      return await updateProfileUrl(_downloadUrl);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> updateProfileUrl(String url) async {
    try {
      await _userDataCollection
          .document(_userId)
          .updateData({'profileUrl': url});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> updateNotification(bool data) async {
    try {
      await _userDataCollection
          .document(_userId)
          .updateData({'shouldNotify': data});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<Response> updateUsername(String username) async {
    try {
      await _userDataCollection
          .document(_userId)
          .updateData({'userName': username});
      return Response(status: Status.SUCCESS);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }

  Future<void> _addIsGoingEvent(DocumentReference documentId) async {
    UserData me = await this.userData.first;
    List<dynamic> goingEvents = me.going;
    goingEvents.add(documentId);
    return _updateGoingEvents(goingEvents);
  }

  Future<void> _removeIsGoingEvent(DocumentReference documentId) async {
    UserData me = await this.userData.first;
    List<dynamic> goingEvents =
        me.going.map<String>((dynamic df) => df.path).toList();
    goingEvents.remove(documentId.path);
    return _updateGoingEvents(goingEvents);
  }

  Future<void> _updateGoingEvents(List<dynamic> newGoingEvents) async {
    return _userDataCollection
        .document(_userId)
        .updateData({'going': newGoingEvents});
  }

  Future<void> _addIsInterestedEvent(DocumentReference documentId) async {
    UserData me = await this.userData.first;
    List<dynamic> interestedEvents = me.interested;
    interestedEvents.add(documentId);
    return _updateInterestedEvents(interestedEvents);
  }

  Future<void> _removeIsInterestedEvent(DocumentReference documentId) async {
    UserData me = await this.userData.first;
    List<dynamic> interestedEvents =
        me.interested.map<String>((dynamic df) => df.path).toList();
    interestedEvents.remove(documentId.path);
    return _updateInterestedEvents(interestedEvents);
  }

  Future<void> _updateInterestedEvents(
      List<dynamic> newInterestedEvents) async {
    return _userDataCollection
        .document(_userId)
        .updateData({'interested': newInterestedEvents});
  }

  Future<void> setGoingStatus(
      String eventId, bool status, DocumentReference documentId) async {
    UserData me = await this.userData.first;
    List<String> meGoingPaths =
        me.going.map<String>((dynamic df) => df.path).toList();
    bool isGoing = meGoingPaths.contains(documentId.path);
    if (isGoing == status) return true; // no status change needed
    // Set status in user document
    if (status) {
      await _addIsGoingEvent(documentId)
          .catchError((error) => Future.error(error));
      return EventService.addUserToGoing(eventId, _userId);
    } else {
      await _removeIsGoingEvent(documentId)
          .catchError((error) => Future.error(error));
      return EventService.removeUserFromGoing(eventId, _userId);
    }
  }

  Future<void> setInterestedStatus(
      String eventId, bool status, DocumentReference documentId) async {
    UserData me = await this.userData.first;
    List<String> meInterestedPaths =
        me.interested.map<String>((dynamic df) => df.path).toList();
    bool isInterested = meInterestedPaths.contains(documentId.path);
    if (isInterested == status) return true; // no status change needed
    // Set status in user document
    if (status) {
      await _addIsInterestedEvent(documentId)
          .catchError((error) => Future.error(error));
      return EventService.addUserToInterested(eventId, _userId);
    } else {
      await _removeIsInterestedEvent(documentId)
          .catchError((error) => Future.error(error));
      return EventService.removeUserFromInterested(eventId, _userId);
    }
  }
}
