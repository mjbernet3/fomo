import 'dart:async';
import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc {
  final AuthService _authService;
  final BehaviorSubject<String> _email = BehaviorSubject<String>();
  final BehaviorSubject<String> _password = BehaviorSubject<String>();

  LoginBloc({AuthService authService}) : _authService = authService;

  Stream<String> get validatedEmail => _email.stream.transform(_validateEmail);

  Stream<String> get validatedPassword =>
      _password.stream.transform(_validatePassword);

  Function(String email) get changeEmail => _email.sink.add;

  Function(String password) get changePassword => _password.sink.add;

  final StreamTransformer<String, String> _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Email failed validation');
    }
  });

  final StreamTransformer<String, String> _validatePassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    if (password.length > 6) {
      sink.add(password);
    } else {
      sink.addError('Password failed validation');
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
  }
}
