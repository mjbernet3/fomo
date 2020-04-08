import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/user.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_fomo/pages/forgot_pass_page.dart';

class EditField extends StatefulWidget {

  final String data;
  final Function toChange;
  final IconData icon;
  final bool dataActive;
  final bool editable;
  final String title;

  EditField({@required this.data, @required this.toChange, @required this.icon, @required this.dataActive, @required this.editable,
  @required this.title});

  @override
  _EditFieldState createState() => _EditFieldState(data: data, toChange: toChange,
      icon: icon, dataActive: dataActive, title: title, editable: editable);
}


class _EditFieldState extends State<EditField> {

  String editedData;
  String data;
  String title;
  bool dataActive;
  bool editable;
  Function toChange;
  IconData icon;

  _EditFieldState({@required this.data, @required this.toChange, @required this.icon,
    @required this.dataActive, @required this.editable, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Icon(
            icon,
          ),
        ),
        Expanded(
          flex: 4,
          child: TextFormField(
            onChanged: (value) {
              editedData = value;
            },
            initialValue: data,
            enabled: dataActive,
            decoration: (editable ?
              InputDecoration( labelText: title,) :
              InputDecoration(border: InputBorder.none, labelText: title,)
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: (editable ? IconButton(
            icon: (dataActive ? Icon(Icons.check) : Icon(Icons.edit)),
            onPressed: () {
              setState(() {
                if (dataActive) {
                  dataActive = false;
                  toChange(editedData);
                } else {
                  dataActive = true;
                }
//                toChange(dataActive, editedData);
              });
            },
          ) : SizedBox(height: 10,)),
        ),
      ],
    );
  }
}