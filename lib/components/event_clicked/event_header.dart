import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/gradient_button.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/components/event_clicked/event_buttons.dart';
import 'package:project_fomo/models/event.dart';

class EventHeader extends StatelessWidget {
  final Event event;

  EventHeader({@required this.event});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Image.network(
          event.imageUrl,
          color: Color.fromRGBO(255, 255, 255, 0.5),
          colorBlendMode: BlendMode.modulate,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                event.name,
                style: TextStyle(
                    color: AppTextColor.title,
                    fontWeight: AppFontWeight.bold,
                    fontFamily: AppFontFamily.family,
                    fontSize: AppFontSize.size28),
              ),
              EventButtons(event: event,),
            ],
          ),
        ),
      ],
    );
  }
}
