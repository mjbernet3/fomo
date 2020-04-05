import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function onChanged;

  const InputField({this.hintText, this.icon, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onChanged(value),
      cursorColor: AppTextColor.mediumEmphasis,
      autocorrect: false,
      decoration: InputDecoration(
        alignLabelWithHint: false,
        focusedBorder: AppDecoration.inputFieldUnderline,
        enabledBorder: AppDecoration.inputFieldUnderline,
        icon: Icon(
          icon,
          color: AppColor.dp24,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppTextColor.mediumEmphasis,
        ),
      ),
    );
  }
}
