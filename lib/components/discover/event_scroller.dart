import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/view_all_bloc.dart';
import 'package:project_fomo/components/discover/event_card.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/pages/view_all_page.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';

const double leftTitlePadding = 15.0;

class EventScroller extends StatelessWidget {
  final String title;
  final List<Event> events;

  EventScroller(this.title, this.events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: leftTitlePadding),
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppTextColor.title,
                    fontSize: AppFontSize.size18,
                    fontFamily: AppFontFamily.family,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ViewAllBloc bloc =
                      Provider.of<ViewAllBloc>(context, listen: false);
                  bloc.setCategory(this.title.toLowerCase());
                  Navigator.pushNamed(context, ViewAllPage.pageRoute);
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      "View All",
                      style: TextStyle(
                        color: AppTextColor.mediumEmphasis,
                        fontSize: AppFontSize.size14,
                        fontFamily: AppFontFamily.family,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: AppFontSize.size14,
                        color: AppTextColor.mediumEmphasis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            itemBuilder: (context, index) => SizedBox(
              width: 15.0,
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 220,
              child: SmallEventCard(
                event: events[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
