import 'package:project_fomo/blocs/bloc.dart';
import 'package:project_fomo/models/event.dart';
import 'package:rxdart/rxdart.dart';

class EventPageBloc extends Bloc {
  Event _pageEvent;
  final BehaviorSubject<Event> _eventPageSubject = BehaviorSubject<Event>();

  EventPageBloc(Event event) : _pageEvent = event;
  Stream<Event> get event => _eventPageSubject.stream;

  Future<void> setPageEvent(Event pageEvent) async {
    print("recieved event in bloc. Setting page...");
    _pageEvent = pageEvent;
    print(_pageEvent.imageUrl);
    _eventPageSubject.sink.add(_pageEvent);
  }

  @override
  void dispose() {
    _eventPageSubject.close();
  }
}
