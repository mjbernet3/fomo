import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class GradientButton extends StatelessWidget {
  final String buttonText;
  final Function buttonPressed;

  GradientButton({@required this.buttonText, @required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: ButtonTheme(
              child: FlatButton(
                color: Colors.transparent,
                onPressed: buttonPressed,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50),
                ),
                child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTextColor.highEmphasis,
                    fontFamily: AppFontFamily.family,
                    fontSize: AppFontSize.size22,
                  ),
                ),
              ),
              minWidth: 150.0,
              height: MediaQuery.of(context).size.width * 0.12),
          decoration: BoxDecoration(
            color: AppColor.background,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
      height: MediaQuery.of(context).size.width * 0.14,
      decoration: BoxDecoration(
        gradient: AppColor.gradient,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
