import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends Bloc {
  final UserService _userService;
  final PublishSubject<UserData> _userDataSubject = PublishSubject<UserData>();

  Stream<UserData> get userData => _userDataSubject.stream;

  UserBloc({UserService userService}) : _userService = userService;

  Future<void> initializeUserData() async {
    UserData userData = await _userService.getUserData();

    print(userData);
  }

  @override
  void dispose() {
    print('Disposing user bloc...');
    _userDataSubject.close();
  }
}
