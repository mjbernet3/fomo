import 'package:project_fomo/models/event.dart';

/*
    Since you can only pass one argument to a route, this data structure is
    used to pass both arguments that view all needs
 */
class ViewAllArguments {
  final String category;
  final List<Event> events;

  ViewAllArguments({this.category, this.events});
}
