import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class CustomButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: ButtonTheme(
                height: 70,
                child: FlatButton(
                  onPressed: () {

                  },
                  child: Text(
                    "Interested",
                    style: TextStyle(
                      color: AppTextColor.disabled,
                      fontSize: AppFontSize.size18,
                      fontWeight: AppFontWeight.bold,
                      fontFamily: AppFontFamily.family,
                    ),
                  ),
                )
            )
        ),
        Expanded(
            child: ButtonTheme(
                height: 70,
                child: FlatButton(
                    onPressed: () {

                    },
                    child: Text(
                      "Going",
                      style: TextStyle(
                        color: AppTextColor.disabled,
                        fontSize: AppFontSize.size18,
                        fontWeight: AppFontWeight.bold,
                        fontFamily: AppFontFamily.family,
                      ),
                    )
                )
            )
        ),
      ],
    );
  }
}
