import 'package:project_fomo/services/search_service.dart';

import 'bloc.dart';

class SearchBloc extends Bloc {
  SearchService _searchService;

  SearchBloc({SearchService searchService}) : _searchService = searchService;

  @override
  void dispose() {
    print('Disposing search bloc...');
  }
}
