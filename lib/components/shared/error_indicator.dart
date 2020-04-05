import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class ErrorIndicator extends StatelessWidget {
  final String errorText;

  const ErrorIndicator({this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorText,
        style: TextStyle(
          color: AppTextColor.highEmphasis,
          fontFamily: AppFontFamily.family,
          fontSize: AppFontSize.size18,
          fontWeight: AppFontWeight.normal,
        ),
      ),
    );
  }
}
