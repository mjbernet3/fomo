import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:rxdart/rxdart.dart';

class DiscoverBloc extends Bloc {
  final EventService _eventService;
  final PublishSubject<Map<String, List<Event>>> _eventsSubject =
      PublishSubject<Map<String, List<Event>>>();

  /*
      Idea for later: How about caching a timestamp and then only getting
      events since that timestamp?
   */

  DiscoverBloc({EventService eventService}) : _eventService = eventService;

  Stream<Map<String, List<Event>>> get events => _eventsSubject.stream;

  Future<void> refreshEventCategories() async {
    Map<String, List<Event>> categories =
        await _eventService.getEventCategories();

    _eventsSubject.sink.add(categories);
  }

  @override
  void dispose() {
    _eventsSubject.close();
  }
}
