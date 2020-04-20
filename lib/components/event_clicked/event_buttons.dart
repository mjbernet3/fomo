import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/gradient_button.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class EventButtons extends StatefulWidget {
  final Event event;

  EventButtons({@required this.event});

  @override
  _EventButtonsState createState() => _EventButtonsState(event: event);
}

class _EventButtonsState extends State<EventButtons> {
  Event event;

  _EventButtonsState({@required this.event});

  @override
  Widget build(BuildContext context) {
    final UserService _userService =
        Provider.of<UserService>(context, listen: false);

    final EventService _eventService =
        Provider.of<EventService>(context, listen: false);

    return StreamBuilder(
        stream: _userService.userData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingIndicator();
          }

          final UserData _userData = snapshot.data;
          DocumentReference documentId =
              _eventService.getDocumentReference(event.id);

          bool isGoing = _userData.going
              .map<String>((dynamic df) => df.path)
              .toList()
              .contains(documentId.path);

          bool isInterested = _userData.interested
              .map<String>((dynamic df) => df.path)
              .toList()
              .contains(documentId.path);

          return Row(
            children: <Widget>[
              GradientButton(
                buttonText: Text(
                  'Going',
                  style: TextStyle(
                    fontSize: AppFontSize.size18,
                    fontFamily: AppFontFamily.family,
                    color: AppTextColor.highEmphasis,
                  ),
                ),
                buttonPressed: () {
                  if (isGoing == false && isInterested == true) {
                    _userService.setInterestedStatus(event.id, false, documentId);
                  }
                  _userService.setGoingStatus(event.id, !isGoing, documentId);
                },
                outlineColor: isGoing,
              ),
              SizedBox(
                width: 15,
              ),
              GradientButton(
                buttonText: Text(
                  'Interested',
                  style: TextStyle(
                    fontSize: AppFontSize.size18,
                    fontFamily: AppFontFamily.family,
                    color: AppTextColor.highEmphasis,
                  ),
                ),
                buttonPressed: () {
                  if (isInterested == false && isGoing == true) {
                    _userService.setGoingStatus(event.id, false, documentId);
                  }
                  _userService.setInterestedStatus(event.id, !isInterested, documentId);
                },
                outlineColor: isInterested,
              ),
            ],
          );
        });
  }
}
