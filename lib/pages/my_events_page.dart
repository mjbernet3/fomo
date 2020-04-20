import 'package:flutter/material.dart';
import 'package:project_fomo/components/my_events/MyAppBar.dart';
import 'package:project_fomo/components/shared/page_header.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:project_fomo/models/user_data.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_fomo/components/my_events/my_events_body.dart';
import 'package:project_fomo/blocs/my_events_bloc.dart';

class MyEventsPage extends StatelessWidget {
  static const String pageRoute = '/';

  final List<Tab> pageTabs = <Tab>[
    Tab(text: 'Interested'),
    Tab(text: 'Going'),
  ];

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyAppbar(
          tabBar: TabBar(
            indicatorColor: AppTextColor.mediumEmphasis,
            labelColor: AppTextColor.highEmphasis,
            unselectedLabelColor: AppTextColor.disabled,
            labelPadding: EdgeInsets.only(top: 10.0),
            labelStyle: TextStyle(
                fontSize: AppFontSize.size20,
                fontWeight: AppFontWeight.bold,
                fontFamily: AppFontFamily.family),
            tabs: pageTabs,
          ),
          title: PageHeader("My Events"),
        ),
        body: Provider<MyEventsBloc>(
          create: (context) => MyEventsBloc(
            userService: Provider.of<UserService>(
              context,
              listen: false,
            ),
          ),
          dispose: (context, bloc) => bloc.dispose(),
          child: MyEventsBody(),
        ),
      ),
    );
  }
}
