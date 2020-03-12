import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/auth_bloc.dart';
import 'package:project_fomo/components/shared/gradient_button.dart';
import 'package:project_fomo/components/shared/input_field.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/components/shared/valid_input_field.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/utils/response.dart';
import 'package:provider/provider.dart';

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  AuthBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<AuthBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String _userName = '';
    String _name = '';

    return Padding(
      padding: EdgeInsets.only(bottom: 40, left: 15, right: 15, top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PageHeader('Register'),
          SizedBox(height: 40),
          ValidInputField(
            inputStream: _bloc.validatedEmail,
            labelText: 'Email Address',
            icon: Icons.email,
            onChanged: (value) => _bloc.changeEmail(value),
          ),
          SizedBox(
            height: 30,
          ),
          ValidInputField(
            inputStream: _bloc.validatedPassword,
            labelText: 'Password',
            icon: Icons.lock,
            onChanged: (value) => _bloc.changePassword(value),
            isHidden: true,
          ),
          SizedBox(
            height: 30,
          ),
          InputField(
            labelText: 'Username',
            icon: Icons.person,
            onChanged: (value) => _userName = value,
          ),
          SizedBox(
            height: 30,
          ),
          InputField(
            labelText: 'Name',
            icon: Icons.face,
            onChanged: (value) => _name = value,
          ),
          SizedBox(
            height: 30,
          ),
          GradientButton(
            buttonText: Text(
              'Register',
              style: TextStyle(
                fontSize: AppFontSize.size22,
                fontFamily: AppFontFamily.family,
              ),
            ),
            buttonPressed: () async {
              _bloc.changeLoading(true);
              Response response =
                  await _bloc.register(userName: _userName, name: _name);
              if (response.status == Status.FAILURE) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Failed to register: ${response.message}',
                      style: TextStyle(
                        color: AppTextColor.title,
                        fontFamily: AppFontFamily.family,
                      ),
                    ),
                    backgroundColor: AppColor.dp4,
                    duration: Duration(seconds: 2),
                  ),
                );

                _bloc.changeLoading(false);
              }
            },
          ),
          StreamBuilder(
            stream: _bloc.loading,
            initialData: false,
            builder: (context, snapshot) {
              return snapshot.data == true ? LoadingIndicator() : Container();
            },
          ),
        ],
      ),
    );
  }
}
