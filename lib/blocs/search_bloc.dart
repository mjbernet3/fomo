import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/services/search_service.dart';
import 'package:project_fomo/utils/response.dart';
import 'package:rxdart/rxdart.dart';
import 'bloc.dart';

enum SearchState {
  IDLE,
  LOADING,
  RESULT,
  ERROR,
}

class SearchBloc extends Bloc {
  SearchService _searchService;
  PublishSubject<SearchState> _searchStateSubject =
      PublishSubject<SearchState>();
  PublishSubject<List<Event>> _eventsSubject = PublishSubject<List<Event>>();

  SearchBloc({SearchService searchService}) : _searchService = searchService;

  Stream<SearchState> get searchState => _searchStateSubject.stream;

  Stream<List<Event>> get events => _eventsSubject.stream;

  Future<void> search(String searchText) async {
    _searchStateSubject.sink.add(SearchState.LOADING);

    Response response = await _searchService.searchEvents(searchText);

    if (response.status == Status.SUCCESS) {
      _searchStateSubject.add(SearchState.RESULT);
      _eventsSubject.sink.add(response.data);
    } else {
      _searchStateSubject.add(SearchState.ERROR);
    }
  }

  @override
  void dispose() {
    print('Disposing search bloc...');
    _searchStateSubject.close();
    _eventsSubject.close();
  }
}
