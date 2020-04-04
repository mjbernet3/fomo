import 'package:flutter/cupertino.dart';

/*
    For instances where you need to pass state information and
    data through a stream at the same time
 */
class PageState {
  final dynamic state;
  final dynamic data;

  PageState({@required this.state, this.data});
}

enum SearchState {
  IDLE,
  LOADING,
  RESULT,
}
