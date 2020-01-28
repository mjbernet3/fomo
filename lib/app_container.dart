import 'package:project_fomo/backend/models/user.dart';
import 'package:project_fomo/backend/services/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/*
    This is the place to register dependencies to be used throughout application

    1) You will not have access to dependency you want unless you register here first
    2) If one dependency needs another, the dependent one needs to be registered second
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
