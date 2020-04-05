import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class ValidInputField extends StatelessWidget {
  final Stream<String> inputStream;
  final String labelText;
  final IconData icon;
  final Function onChanged;
  final bool isHidden;

  const ValidInputField(
      {this.inputStream,
      this.labelText,
      this.icon,
      this.onChanged,
      this.isHidden = false});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: inputStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: (value) => onChanged(value),
          cursorColor: AppTextColor.mediumEmphasis,
          autocorrect: false,
          obscureText: isHidden,
          decoration: InputDecoration(
            alignLabelWithHint: false,
            focusedBorder: AppDecoration.inputFieldUnderline,
            enabledBorder: AppDecoration.inputFieldUnderline,
            icon: Icon(
              icon,
              color: AppColor.dp24,
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: AppTextColor.mediumEmphasis,
            ),
            errorText: snapshot.error,
            errorStyle: TextStyle(
              color: AppTextColor.highEmphasis,
            ),
          ),
        );
      },
    );
  }
}
