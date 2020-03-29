import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:rxdart/rxdart.dart';

class ViewAllBloc extends Bloc {
  EventService _eventService;
  Event _lastEvent;
  String _category;
  final BehaviorSubject<List<Event>> _viewAllPageNextEventsSubject =
      BehaviorSubject<List<Event>>();
  final BehaviorSubject<String> _viewAllPageCategorySubject =
      BehaviorSubject<String>();

  Stream<List<Event>> get nextEvents => _viewAllPageNextEventsSubject.stream;
  Stream<String> get viewAllVCategory => _viewAllPageCategorySubject.stream;

  ViewAllBloc({EventService eventService}) : _eventService = eventService;

  void setCategory(String category) {
    _category = category;
    _lastEvent = null;
    _viewAllPageCategorySubject.sink.add(_category);
  }

  void loadNextEvents() {
    switch (_category) {
      case 'upcoming':
        getNextUpcomingEvents();
        break;
      case 'popular':
        getNextPopularEvents();
        break;
      case '':
        throw FormatException("Category has not been set");
        break;
      default:
        throw FormatException("Category: $_category is not recognized");
        break;
    }
  }

  void getNextUpcomingEvents() async {
    List<Event> nextEvents =
        await _eventService.getPaginatedUpcomingEvents(_lastEvent);
    _lastEvent = nextEvents.last;
    _viewAllPageNextEventsSubject.sink.add(nextEvents);
  }

  void getNextPopularEvents() async {
    List<Event> nextEvents =
        await _eventService.getPaginatedPopularEvents(_lastEvent);
    _lastEvent = nextEvents.last;
    _viewAllPageNextEventsSubject.sink.add(nextEvents);
  }

  @override
  void dispose() {
    _viewAllPageNextEventsSubject.close();
    _viewAllPageCategorySubject.close();
  }
}
