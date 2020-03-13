import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class SettingsItem extends StatelessWidget {
  final String name;
  final Widget trailing;
  final Function onPressed;
  final EdgeInsetsGeometry padding;

  SettingsItem({
    @required this.name,
    this.trailing,
    this.onPressed,
    this.padding,
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
      onTap: onPressed,
      child: Padding(
        padding: padding ?? EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              name,
              style: itemNameStyle,
            ),
            trailing ?? Container(),
          ],
        ),
      ),
    );
  }
}
