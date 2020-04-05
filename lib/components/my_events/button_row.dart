import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';
//import 'package:project_fomo/backend/state_models/button_row_model.dart';
import 'package:provider/provider.dart';

class CustomButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final ButtonRowModel buttonBloc = Provider.of<ButtonRowModel>(context);
    //int buttonSelected = buttonBloc.buttonIndex;

    return Row(
      children: <Widget>[
        Expanded(
            child: ButtonTheme(
                height: 70,
                child: FlatButton(
                  //onPressed: () => buttonBloc.pressed(0),
                  child: Text(
                    "Interested",
                    style: TextStyle(
                      color: AppTextColor.disabled,
                      //buttonSelected == 0
                       //       ? AppTextColor.title
                        //      : AppTextColor.disabled,
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
                    //onPressed: () => buttonBloc.pressed(1),
                    child: Text(
                      "Going",
                      style: TextStyle(
                        color: AppTextColor.disabled,//  buttonSelected == 1
                               // ? AppTextColor.title
                               // : AppTextColor.disabled,
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
