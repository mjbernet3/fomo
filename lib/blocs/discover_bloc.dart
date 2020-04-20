import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:rxdart/rxdart.dart';

class DiscoverBloc extends Bloc {
  final EventService _eventService;
  final UserService _userService;
  final PublishSubject<Map<String, List<Event>>> _eventsSubject =
      PublishSubject<Map<String, List<Event>>>();

  DiscoverBloc(this._eventService, this._userService);

  Stream<Map<String, List<Event>>> get events => _eventsSubject.stream;

  Future<void> refreshEventCategories() async {
    if (!_eventsSubject.isClosed) {
      Map<String, List<Event>> categories =
          await _eventService.getEventsByCategory(_userService);
      if (!_eventsSubject.isClosed) {
        _eventsSubject.sink.add(categories);
      }
    }
  }

  @override
  void dispose() {
    print('Disposing discover bloc...');
    _eventsSubject.close();
  }
}
