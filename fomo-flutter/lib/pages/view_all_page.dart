import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/list_event_card.dart';
import 'package:project_fomo/style.dart';

class ViewAllPage extends StatelessWidget {
  static const String pageRoute = '/view-all';
  final List events = []; // TODO: Use actual events
  final String title = ""; // TODO: Use actual title

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: AppFontSize.size22,
            fontFamily: AppFontFamily.family,
          ),
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
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return ListEventCard(event: events[index]);
          },
        ),
      ),
    );
  }
}
