import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/view_all_bloc.dart';
import 'package:project_fomo/components/shared/list_event_card.dart';
import 'package:project_fomo/models/event.dart';
import 'package:provider/provider.dart';

class ViewAllBody extends StatefulWidget {
  @override
  _ViewAllBodyState createState() => _ViewAllBodyState();
}

class _ViewAllBodyState extends State<ViewAllBody> {
  ViewAllBloc _bloc;
  ScrollController _scrollController;
  List<Event> _events;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _events = [];
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _bloc.loadNextEvents();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<ViewAllBloc>(context, listen: false);
    _bloc.loadNextEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: _bloc.nextEvents,
        builder: (context, AsyncSnapshot<List<Event>> nextEvents) {
          _events.addAll(nextEvents.data);
          return ListView.builder(
            controller: _scrollController,
            itemCount: _events.length,
            itemBuilder: (context, index) {
              return ListEventCard(event: _events[index]);
            },
          );
        },
      ),
    );
  }
}
