import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/view_all_bloc.dart';
import 'package:project_fomo/components/shared/list_event_card.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

class ViewAllBody extends StatefulWidget {
  @override
  _ViewAllBodyState createState() => _ViewAllBodyState();
}

class _ViewAllBodyState extends State<ViewAllBody> {
  ViewAllBloc _bloc;
  ScrollController _scrollController;

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _bloc.loadMoreEvents();
    }
  }

  @override
  void didChangeDependencies() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.didChangeDependencies();
    _bloc = Provider.of<ViewAllBloc>(context, listen: false);
    _bloc.loadMoreEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: StreamBuilder(
          stream: _bloc.category,
          builder: (context, AsyncSnapshot<String> category) {
            if (!category.hasData) {
              return Container();
            }
            String title = category.data.substring(0, 1).toUpperCase() +
                category.data.substring(1).toLowerCase();
            return Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: AppFontSize.size22,
                fontFamily: AppFontFamily.family,
              ),
            );
          },
        ),
        bottom: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColor.gradient,
            ),
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: _bloc.events,
          builder: (context, AsyncSnapshot<List<Event>> events) {
            if (!events.hasData) {
              return Container();
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: events.data.length,
              itemBuilder: (context, index) {
                return ListEventCard(event: events.data[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
