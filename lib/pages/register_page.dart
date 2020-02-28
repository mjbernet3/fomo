import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/auth_bloc.dart';
import 'package:project_fomo/components/register/register_body.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  static const String pageRoute = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Provider<AuthBloc>(
        create: (context) => AuthBloc(
          authService: Provider.of<AuthService>(
            context,
            listen: false,
          ),
        ),
        dispose: (context, bloc) => bloc.dispose(),
        child: RegisterBody(),
      ),
    );
  }
}
