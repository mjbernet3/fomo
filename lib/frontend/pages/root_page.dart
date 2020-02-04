import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/pages/friends_page.dart';
import 'package:project_fomo/frontend/pages/my_events_page.dart';
import 'package:project_fomo/frontend/pages/profile_page.dart';
import 'package:project_fomo/frontend/pages/search_page.dart';
import 'package:project_fomo/router.dart' as router;
import 'package:project_fomo/frontend/pages/discover_page.dart';

class RootPage extends StatefulWidget {
  static const String pageRoute = '/root';

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;

  static const Map<int, String> mainPageMap = {
    0: DiscoverPage.pageRoute,
    1: SearchPage.pageRoute,
    2: FriendsPage.pageRoute,
    3: MyEventsPage.pageRoute,
    4: ProfilePage.pageRoute,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _navigatorKey,
        initialRoute: DiscoverPage.pageRoute,
        onGenerateRoute: router.generateRoute,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black26,
        fixedColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });

          _navigatorKey.currentState
              .pushReplacementNamed(mainPageMap[_selectedIndex]);
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text(''),
          ),
        ],
      ),
    );
  }
}
