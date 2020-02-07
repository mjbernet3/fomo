import 'package:project_fomo/backend/models/user.dart';
import 'package:project_fomo/backend/services/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/*
    This is the place to register dependencies to be used throughout application

    Note: If one dependency relies on another, register reliant one second
 */
class AppContainer {
  static AuthService authService = AuthService();
  static Stream<User> signedInUser = authService.signedInUser;

  List<SingleChildWidget> providers = [
    Provider<AuthService>.value(
      value: authService,
    ),
    StreamProvider<User>.value(
      value: signedInUser,
    )
  ];
}
