import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/discover_bloc.dart';
import 'package:project_fomo/components/discover/event_scroller.dart';
import 'package:project_fomo/components/discover/featured_carousel.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:provider/provider.dart';

const double leftTitlePadding = 15.0;

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
    _bloc.refreshEventCategories();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: StreamBuilder(
          stream: _bloc.events,
          builder: (context, AsyncSnapshot<Map<String, List<Event>>> snapshot) {
            List<Widget> listChildren = [];
            if (snapshot.hasData) {
              Map<String, List<Event>> categories = snapshot.data;
              for (String category in categories.keys) {
                List<Event> events = categories[category];
                if (category == "featured" && events.length > 0) {
                  listChildren.insert(0, FeaturedCarousel(events));
                } else {
                  listChildren.add(Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: EventScroller(formatCategoryTitle(category), events),
                  ));
                }
              }
            }
            listChildren.insert(
              0,
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    leftTitlePadding, 30.0, 0.0, 25.0),
                child: PageHeader("Discover"),
              ),
            );
            listChildren.add(
              GestureDetector(
                onTap: () {
                  Provider.of<UserService>(context, listen: false)
                      .addFriend('mbernet');
                },
                child: Container(
                  color: Color.fromRGBO(255, 0, 0, 1.0),
                  height: 100,
                ),
              ),
            );
            return RefreshIndicator(
              displacement: 0,
              onRefresh: () => _bloc.refreshEventCategories(),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: listChildren,
              ),
            );
          },
        ),
      ),
    );
  }

  String formatCategoryTitle(String title) {
    String newTitle = title.toLowerCase();
    newTitle = newTitle.substring(0, 1).toUpperCase() + newTitle.substring(1);
    return newTitle;
  }
}
