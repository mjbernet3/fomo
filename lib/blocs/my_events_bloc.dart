import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:rxdart/rxdart.dart';

class MyEventsBloc extends Bloc {
  final UserService _userService;
  final BehaviorSubject<List<Event>> _goingSubject =
      BehaviorSubject<List<Event>>();
  final BehaviorSubject<List<Event>> _interestedSubject =
      BehaviorSubject<List<Event>>();

  MyEventsBloc({UserService userService}) : _userService = userService;

  Stream<List<Event>> get goingEvents => _goingSubject.stream;

  Stream<List<Event>> get interestedEvents => _interestedSubject.stream;

  Future<void> refreshEventCategories() async {
    if (!_goingSubject.isClosed) {
      List<Event> going = await _userService.getGoingEvents();
      if (!_goingSubject.isClosed) {
        _goingSubject.sink.add(going);
      }
    }
    if (!_interestedSubject.isClosed) {
      List<Event> interested = await _userService.getInterestedEvents();
      if (!_interestedSubject.isClosed) {
        _interestedSubject.sink.add(interested);
      }
    }
  }

  @override
  void dispose() {
    print('Disposing my events bloc...');
    _goingSubject.close();
    _interestedSubject.close();
  }
}
