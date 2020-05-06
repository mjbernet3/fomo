import 'dart:async';
import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/services/auth_service.dart';
import 'package:project_fomo/utils/structures/response.dart';
import 'package:rxdart/rxdart.dart';

/*
    Since login/register pages have the same need using one bloc to avoid
    duplicating code.
 */
class AuthBloc extends Bloc {
  final AuthService _authService;
  final BehaviorSubject<String> _emailSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordSubject = BehaviorSubject<String>();
  final PublishSubject<bool> _isLoadingSubject = PublishSubject<bool>();
  static final RegExp _emailRegExp =
      RegExp('[a-zA-Z0-9_\.\+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-\.]+');

  AuthBloc({AuthService authService}) : _authService = authService;

  Stream<String> get validatedEmail =>
      _emailSubject.stream.transform(_validateEmail);

  Stream<String> get validatedPassword =>
      _passwordSubject.stream.transform(_validatePassword);

  Stream<bool> get loading => _isLoadingSubject.stream;

  Function(String email) get changeEmail => _emailSubject.sink.add;

  Function(String password) get changePassword => _passwordSubject.sink.add;

  Function(bool loading) get changeLoading => _isLoadingSubject.sink.add;

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

  Future<Response> login() async {
    return await _authService.signInWithEmailAndPassword(
        _emailSubject.value, _passwordSubject.value);
  }

  Future<Response> register({String userName, String name}) async {
    return await _authService.registerWithEmailAndPassword(
        _emailSubject.value, _passwordSubject.value, userName, name);
  }

  @override
  void dispose() {
    _emailSubject.close();
    _passwordSubject.close();
    _isLoadingSubject.close();
  }
}
