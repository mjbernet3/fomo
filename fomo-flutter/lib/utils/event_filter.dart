import 'package:project_fomo/models/event.dart';

class EventFilter {
  static const List FEATURED_EVENTS = [
    "4nkEZMSzdjDDeRMOhbHI",
    "Er300Iu2zmq1njTUlV8k",
    "HskRO8SwoZabFu3j40XV",
  ];
  static const int POPULAR_NUM_GOING = -1; // All events popular
  static const int POPULAR_NUM_INTERESTED = -1; // All events popular
  static const double UPCOMING_RANGE = double.infinity; // All events upcoming

  static List<Event> filterFeatured(List<Event> events) {
    List<Event> featuredEvents =
        events.where((event) => FEATURED_EVENTS.contains(event.id)).toList();
    return featuredEvents;
  }

  static List<Event> filterPopular(List<Event> events) {
    List<Event> popularEvents = events
        .where((event) =>
            event.usersGoing.length > POPULAR_NUM_GOING ||
            event.usersInterested.length > POPULAR_NUM_INTERESTED)
        .toList();

    return popularEvents;
  }

  static List<Event> filterUpcoming(List<Event> events) {
    List<Event> upcomingEvents = events
        .where((event) =>
            DateTime.now().difference(event.dateTime).inDays <= UPCOMING_RANGE)
        .toList();

    return upcomingEvents;
  }
}
