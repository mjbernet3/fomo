import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/frontend/components/shared/page_header.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/frontend/components/my_events/button_row.dart';

class MyEventsPage extends StatelessWidget {
  static const String pageRoute = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
                child: PageHeader("My Events")
              ),
              CustomButtonRow(),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: SizedBox(
                    height: 3.0,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppTextColor.disabled
                      ),
                    ),
                  )
              ),
              Container(
                child: Expanded(
                  child: VerticalEventListing()
                )
              ),
            ],
          )
        )
      )
    );
  }
}
