import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:project_fomo/services/event_service.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/components/my_events/event_card.dart';

class MyEventsPage extends StatelessWidget {
  static const String pageRoute = '/';

  final List<Tab> pageTabs = <Tab>[
    Tab(text: 'Interested'),
    Tab(text: 'Going'),
  ];

  @override
  Widget build(BuildContext context) {
    final UserService _userService =
      Provider.of<UserService>(context, listen: false);

    final EventService _eventService =
      Provider.of<EventService>(context, listen: false);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Events"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            labelColor: const Color(0xff525c6e),
            unselectedLabelColor: const Color(0xffacb3bf),
            indicatorPadding: EdgeInsets.all(0.0),
            indicatorWeight: 4.0,
            labelPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            indicator: ShapeDecoration(
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0, style: BorderStyle.solid)),
                gradient: AppColor.gradient,
            ),
            tabs: <Widget>[
              Container(
                height: 40,
                alignment: Alignment.center,
                child: Text(
                    "Interested",
                style: TextStyle(
                  color: Colors.white
                )),
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: Text(
                    "Going",
                  style: TextStyle(
                      color: Colors.white
                  )),
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: _userService.userData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LoadingIndicator();
            }

            final UserData _userData = snapshot.data;

            List going = _userData.going;
            List interested = _userData.interested;

            return TabBarView(
              children: <Widget>[
                SizedBox(
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: interested.length,
                    itemBuilder: (context, index) => SizedBox(
                      width: 15,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 90,
                      child: ListEventCard(eventId: interested[index],),
                    ),
                  ),
                ),
                SizedBox(
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: going.length,
                    itemBuilder: (context, index) => SizedBox(
                      width: 15,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 90,
                      child: ListEventCard(eventId: going[index],),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      )
    );
  }
}
