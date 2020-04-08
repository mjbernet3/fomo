import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:rxdart/rxdart.dart';

class DiscoverBloc extends Bloc {
  final EventService _eventService;
  final PublishSubject<List<Event>> _eventsSubject =
      PublishSubject<List<Event>>();

  /*
      Idea for later: How about caching a timestamp and then only getting
      events since that timestamp?

      This bloc is not finished, just brainstorming. Right now you would refresh
      and get duplicates.
   */

  DiscoverBloc({EventService eventService}) : _eventService = eventService;

  Stream<List<Event>> get events => _eventsSubject.stream;

  Future<void> refreshEvents() async {
    List<Event> events = await _eventService.getAllEvents();

    _eventsSubject.sink.add(events);
  }

  @override
  void dispose() {
    _eventsSubject.close();
  }
}
