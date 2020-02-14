import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class AuthPageHeader extends StatelessWidget {
  final String title;

  AuthPageHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: AppFontWeight.bold,
                    color: AppTextColor.title,
                    fontSize: AppFontSize.size36,
                    fontFamily: AppFontFamily.family,
                  ),
                ),
              ),
              SizedBox(
                height: 3.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: AppColor.gradient,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(),
        ),
      ],
    );
  }
}
