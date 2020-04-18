import 'package:flutter/material.dart';

class EditField extends StatefulWidget {
  final String data;
  final Function onChanged;
  final IconData icon;
  final bool dataActive;
  final bool editable;
  final String title;

  EditField({
    this.data,
    this.onChanged,
    this.icon,
    this.dataActive,
    this.editable,
    this.title,
  });

  @override
  _EditFieldState createState() => _EditFieldState(
      data: data,
      onChanged: onChanged,
      icon: icon,
      dataActive: dataActive,
      title: title,
      editable: editable);
}

class _EditFieldState extends State<EditField> {
  String editedData;
  String data;
  String title;
  bool dataActive;
  bool editable;
  Function onChanged;
  IconData icon;

  _EditFieldState({
    this.data,
    this.onChanged,
    this.icon,
    this.dataActive,
    this.editable,
    this.title,
  });

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
            decoration: (editable
                ? InputDecoration(
                    labelText: title,
                  )
                : InputDecoration(
                    border: InputBorder.none,
                    labelText: title,
                  )),
          ),
        ),
        Expanded(
          flex: 1,
          child: (editable
              ? IconButton(
                  icon: (dataActive ? Icon(Icons.check) : Icon(Icons.edit)),
                  onPressed: () {
                    setState(
                      () {
                        if (dataActive) {
                          dataActive = false;
                          onChanged(editedData);
                        } else {
                          dataActive = true;
                        }
                      },
                    );
                  },
                )
              : SizedBox(
                  height: 10,
                )),
        ),
      ],
    );
  }
}
