import 'package:algolia/algolia.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/utils/response.dart';

class SearchService {
  // This should be the only instance of algolia
  static final Algolia algolia = Algolia.init(
    applicationId: 'O2MPBMKKD2',
    apiKey: 'd4f96d797d70504632da0d4a6bea61ca',
  );

  Future<Response> searchEvents(String searchText) async {
    try {
      AlgoliaIndexReference eventIndex = algolia.instance.index('events');

      AlgoliaQuery query = eventIndex.search(searchText);

      List<AlgoliaObjectSnapshot> results = (await query.getObjects()).hits;

      List<Event> events =
          results.map((result) => Event.fromAlgoliaSnapshot(result)).toList();

      return Response(status: Status.SUCCESS, data: events);
    } catch (error) {
      return Response(status: Status.FAILURE, message: error.toString());
    }
  }
}
