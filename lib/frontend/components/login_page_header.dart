import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

Widget loginPageHeader(String title) {
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
