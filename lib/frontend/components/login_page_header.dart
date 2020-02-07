import 'package:flutter/material.dart';

/*
Widget created using Paul's rules
 */
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
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF)),
              ),
            ),
            SizedBox(
              height: 3.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFFF6C1A),
                      Color(0xFFF01844),
                      Color(0xFF7E0BC9),
                    ],
                    stops: [
                      0.0,
                      .528,
                      1.0,
                    ],
                  ),
                ),
              ),
            )
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