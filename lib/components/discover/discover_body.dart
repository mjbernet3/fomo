import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/discover_bloc.dart';
import 'package:project_fomo/components/discover/event_scroller.dart';
import 'package:project_fomo/components/discover/featured_carousel.dart';
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
    _bloc = Provider.of<DiscoverBloc>(context);
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
          child: StreamBuilder(
            stream: _bloc.events,
            builder:
                (context, AsyncSnapshot<Map<String, List<Event>>> snapshot) {
              List<Widget> listChildren = [PageHeader("Discover")];
              if (snapshot.hasData) {
                Map<String, List<Event>> categories = snapshot.data;
                for (String category in categories.keys) {
                  List<Event> events = categories[category];
                  if (category == "featured") {
                    listChildren.insert(0, FeaturedCarousel(events));
                  } else {
                    listChildren.add(EventScroller(category, events));
                  }
                }
              }
              return ListView(children: listChildren);
            },
          ),
        ),
      ),
    );
  }
}
