import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class InputField extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function changed;
  final bool hidden;

  InputField(this.title, this.icon, this.changed, [this.hidden = false]);

  static const UnderlineInputBorder defaultLine = UnderlineInputBorder(
    borderSide: const BorderSide(
      color: AppColor.dp24,
      width: 2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              color: AppTextColor.mediumEmphasis,
              fontSize: AppFontSize.size16,
              fontFamily: AppFontFamily.family,
              fontWeight: AppFontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: TextField(
            style: TextStyle(
              color: AppTextColor.highEmphasis,
              fontSize: AppFontSize.size14,
              fontFamily: AppFontFamily.family,
            ),
            obscureText: hidden,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 2, top: 20, bottom: 5),
              alignLabelWithHint: false,
              focusedBorder: defaultLine,
              enabledBorder: defaultLine,
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 0, top: 10),
                child: Icon(
                  icon,
                  size: 25,
                  color: AppColor.dp24,
                ),
              ),
            ),
            onChanged: (String typedValue) {
              changed(typedValue);
            },
          ),
        ),
      ],
    );
  }
}
