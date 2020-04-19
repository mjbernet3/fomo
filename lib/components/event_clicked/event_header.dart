import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/gradient_button.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class EventHeader extends StatelessWidget {
  final String imageURL;
  final String eventName;

  EventHeader({@required this.imageURL, @required this.eventName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Image.network(
          imageURL,
          color: Color.fromRGBO(255, 255, 255, 0.5),
          colorBlendMode: BlendMode.modulate,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                eventName,
                style: TextStyle(
                    color: AppTextColor.title,
                    fontWeight: AppFontWeight.bold,
                    fontFamily: AppFontFamily.family,
                    fontSize: AppFontSize.size28),
              ),
              Row(
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
                      Provider.of<UserService>(context, listen: false)
                          .setGoingStatus('0B8Hs2w6pAOHZoVOaEPN', true);
                    },
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
                      print('User is interested');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
