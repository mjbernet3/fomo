import 'dart:async';
import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc {
  final AuthService _authService;
  final BehaviorSubject<String> _email = BehaviorSubject<String>();
  final BehaviorSubject<String> _password = BehaviorSubject<String>();
  final PublishSubject<bool> _isLoading = PublishSubject<bool>();
  static final RegExp _emailRegExp =
      RegExp('[a-zA-Z0-9_\.\+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-\.]+');

  LoginBloc({AuthService authService}) : _authService = authService;

  Stream<String> get validatedEmail => _email.stream.transform(_validateEmail);

  Stream<String> get validatedPassword =>
      _password.stream.transform(_validatePassword);

  Stream<bool> get loading => _isLoading.stream;

  Function(String email) get changeEmail => _email.sink.add;

  Function(String password) get changePassword => _password.sink.add;

  Function(bool loading) get changeLoading => _isLoading.sink.add;

  final StreamTransformer<String, String> _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.length == 0 || _emailRegExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email address is improperly formatted');
    }
  });

  final StreamTransformer<String, String> _validatePassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    if (password.length == 0 || password.length > 6) {
      sink.add(password);
    } else {
      sink.addError('Password must be at least 6 characters');
    }
  });

  Future<bool> login() async {
    return await _authService.signInWithEmailAndPassword(
        _email.value, _password.value);
  }

  @override
  dispose() {
    _email.close();
    _password.close();
    _isLoading.close();
  }
}
