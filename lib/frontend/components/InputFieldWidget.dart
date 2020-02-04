import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function changed;
  final bool hidden;

  InputField(this.title, this.icon, this.changed, [this.hidden = false]);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      color: Colors.white)
              )
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: TextField(
                obscureText: hidden,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white)
                    ),
                    border: UnderlineInputBorder(),
                    suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 0),
                        child: Icon(icon,
                            color: Colors.white)
                    ),
                    labelStyle: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Raleway',
                        color: Colors.white)
                ),
                onChanged: (String typedValue) {
                  changed(typedValue);
                })
            )
        ]
    );
  }
}