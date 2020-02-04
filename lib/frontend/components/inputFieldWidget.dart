import 'package:flutter/material.dart';

Widget inputField(String title, IconData i, Function changed,
    [bool hidden = false]) {
  return Column(
      children: <Widget>[
    Align(
        alignment: Alignment.topLeft,
        child: Text(title,
            style: TextStyle(
                fontSize: 20, fontFamily: 'Raleway', color: Colors.white))),
    TextField(
//        autofocus: true,
        obscureText: hidden,
        focusNode: FocusNode(),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white)),
            border: UnderlineInputBorder(),
            suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 0),
                child: Icon(i, color: Colors.white)),
            labelStyle: TextStyle(
                fontSize: 40, fontFamily: 'Raleway', color: Colors.white)),
        onChanged: (String typedValue) {
          changed(typedValue);
        })
  ]);
}
