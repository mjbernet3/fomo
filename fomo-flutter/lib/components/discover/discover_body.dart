import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/discover_bloc.dart';
import 'package:project_fomo/components/discover/event_scroller.dart';
import 'package:project_fomo/components/discover/featured_carousel.dart';
import 'package:project_fomo/components/shared/error_indicator.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/models/event.dart';
import 'package:provider/provider.dart';

class DiscoverBody extends StatefulWidget {
  @override
  _DiscoverBodyState createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody> {
  DiscoverBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<DiscoverBloc>(context, listen: false);
    _bloc.refreshEvents();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: StreamBuilder(
          stream: _bloc.events,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LoadingIndicator();
            } else if (snapshot.hasError) {
              return ErrorIndicator(
                errorText: snapshot.error.toString(),
              );
            } else {
              List<Widget> listChildren = [];
              Map<String, List<Event>> categories = snapshot.data;

              for (String category in categories.keys) {
                List<Event> events = categories[category];
                if (category == 'Featured') {
                  if (events.length > 0) {
                    listChildren.insert(0, FeaturedCarousel(events));
                  }
                } else {
                  listChildren.add(
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: EventScroller(category, events),
                    ),
                  );
                }
              }

              listChildren.insert(
                0,
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 25.0),
                  child: PageHeader('Discover'),
                ),
              );
              return RefreshIndicator(
                displacement: 0,
                onRefresh: () => _bloc.refreshEvents(),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: listChildren,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
