import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class Toggle extends StatefulWidget {
  final String name;
  final Function onPressed;
  final EdgeInsetsGeometry padding;
  final bool toggle;

  Toggle({
    @required this.name,
    this.onPressed,
    this.padding,
    this.toggle,
  });

  @override
  _ToggleState createState() => _ToggleState(name: name,
    onPressed: onPressed, padding: padding, toggle: toggle);
}

class _ToggleState extends State<Toggle> {
  String name;
  Function onPressed;
  EdgeInsetsGeometry padding;
  bool toggle;


  _ToggleState({
    @required this.name,
    this.onPressed,
    this.padding,
    this.toggle
  });

  static const TextStyle itemNameStyle = TextStyle(
    fontSize: AppFontSize.size18,
    fontFamily: AppFontFamily.family,
    fontWeight: AppFontWeight.bold,
    color: AppTextColor.mediumEmphasis,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: padding ?? EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              name,
              style: itemNameStyle,
            ),
            Switch(
              value: toggle,
              activeColor: Color(0xFFF01844),
              onChanged: (value) {
                setState(() {
                  toggle = value;
                  onPressed(toggle);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
