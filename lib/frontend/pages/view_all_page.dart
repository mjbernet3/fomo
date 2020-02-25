import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/style.dart';

class ViewAllPage extends StatelessWidget {
  static const String pageRoute = '/view-all';

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
        title: Text(
          'Popular',
          style: TextStyle(
            color: Colors.white,
            fontSize: AppFontSize.size22,
            fontFamily: AppFontFamily.family,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.red,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: VerticalEventListing(),
    );
  }
}
