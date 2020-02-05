import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function changed;
  final bool hidden;

  InputField(this.title, this.icon, this.changed, [this.hidden = false]);

  final UnderlineInputBorder defaultLine = UnderlineInputBorder(
      borderSide: const BorderSide(
          color: Color(0xFF939393),
          width: 2.5));

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      color: Color(0xFF939393))
              )
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child:
            TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontSize: 20
                ),
                obscureText: hidden,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 20,
                        bottom: 5),
                    alignLabelWithHint: false,
                    focusedBorder: defaultLine,
                    enabledBorder: defaultLine,
                    suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            end: 0, top: 10),
                        child: Icon(
                            icon,
                            size: 30,
                            color: Color(0xFF939393))
                    ),
                ),
                onChanged: (String typedValue) {
                  changed(typedValue);
                })
            )
        ]
    );
  }
}