import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:project_fomo/utils/event_filter.dart';
import 'package:project_fomo/utils/structures/response.dart';
import 'package:rxdart/rxdart.dart';

class DiscoverBloc extends Bloc {
  final EventService _eventService;
  final PublishSubject<Map<String, List<Event>>> _eventsSubject =
      PublishSubject<Map<String, List<Event>>>();

  DiscoverBloc({EventService eventService}) : _eventService = eventService;

  Stream<Map<String, List<Event>>> get events => _eventsSubject.stream;

  Future<void> refreshEvents() async {
    Response response = await _eventService.getAllEvents();

    if (response.status == Status.SUCCESS) {
      Map<String, List<Event>> categoryEvents = categorizeEvents(response.data);
      _eventsSubject.sink.add(categoryEvents);
    } else {
      _eventsSubject.sink.addError('Unable to get events...');
    }
  }

  Map<String, List<Event>> categorizeEvents(List<Event> events) {
    Map<String, List<Event>> categoryEvents = {};
    categoryEvents['Featured'] = EventFilter.filterFeatured(events);
    categoryEvents['Popular'] = EventFilter.filterPopular(events);
    categoryEvents['Upcoming'] = EventFilter.filterUpcoming(events);
    return categoryEvents;
  }

  @override
  void dispose() {
    print('Disposing discover bloc...');
    _eventsSubject.close();
  }
}
