import 'package:flutter/material.dart';
import 'package:project_fomo/components/shared/page_header.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final PageHeader title;
  final TabBar tabBar;

  const MyAppbar({this.title, this.tabBar});

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: preferredSize.height,
        child: Column (
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 5.0),
              child: title,
            ),
            tabBar
          ],
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160.0);
}