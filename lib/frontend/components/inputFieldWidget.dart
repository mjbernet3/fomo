import 'package:flutter/material.dart';

Widget inputField(String title, IconData i, Function changed, [bool hidden = false]) {
  return TextField(
      autofocus: true,
      obscureText: hidden,
      focusNode: FocusNode(),
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white)
          ),
          border: UnderlineInputBorder(),
          labelText: title,
          suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Icon(i, color: Colors.white)
          ),
          labelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Raleway',
              color: Colors.white
          )
      ),
      onChanged: (String typedValue) {
        changed(typedValue);
      }
  );
}