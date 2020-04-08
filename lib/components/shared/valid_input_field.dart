import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class ValidInputField extends StatelessWidget {
  final Stream<String> inputStream;
  final String hintText;
  final IconData icon;
  final Function onChanged;
  final bool isHidden;

  const ValidInputField(
      {this.inputStream,
      this.hintText,
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
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppTextColor.mediumEmphasis,
            ),
            suffixIcon: _buildSuffixIcon(snapshot),
          ),
        );
      },
    );
  }

  Widget _buildSuffixIcon(snapshot) {
    if (snapshot.hasData) {
      return Icon(
        Icons.check_circle,
        color: Colors.greenAccent,
      );
    } else if (snapshot.hasError) {
      return Icon(
        Icons.cancel,
        color: Colors.redAccent,
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
