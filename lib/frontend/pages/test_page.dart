import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/event_category.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SizedBox(
              height: 175,
              child: ListViewEventCategory(title: 'Popular', events: null)),
        ),
      ),
    );
  }
}
