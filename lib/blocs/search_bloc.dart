import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/services/search_service.dart';
import 'package:project_fomo/utils/structures/page_state.dart';
import 'package:project_fomo/utils/structures/response.dart';
import 'package:rxdart/rxdart.dart';
import 'bloc.dart';

enum SearchState {
  IDLE,
  RESULT,
}

class SearchBloc extends Bloc {
  SearchService _searchService;
  PublishSubject<PageState> _searchStateSubject = PublishSubject<PageState>();

  SearchBloc({SearchService searchService}) : _searchService = searchService;

  // Streaming data with state to avoid nested StreamBuilder in UI
  Stream<PageState> get searchState => _searchStateSubject.stream;

  Function(PageState state) get changeState => _searchStateSubject.sink.add;

  Future<void> search(String searchText) async {
    Response response = await _searchService.searchEvents(searchText);

    if (response.status == Status.SUCCESS) {
      _searchStateSubject.sink
          .add(PageState(state: SearchState.RESULT, data: response.data));
    } else {
      _searchStateSubject.sink.addError('Unable to complete search...');
    }
  }

  @override
  void dispose() {
    print('Disposing search bloc...');
    _searchStateSubject.close();
  }
}
