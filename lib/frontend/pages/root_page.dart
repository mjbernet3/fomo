import 'package:flutter/material.dart';
import 'package:project_fomo/frontend/components/navigation/discover.dart';
import 'package:project_fomo/frontend/components/navigation/friends.dart';
import 'package:project_fomo/frontend/components/navigation/my_events.dart';
import 'package:project_fomo/frontend/components/navigation/profile.dart';
import 'package:project_fomo/frontend/components/navigation/search.dart';

class RootPage extends StatefulWidget {
  static const String pageRoute = '/root';

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            Discover(),
            Search(),
            Friends(),
            MyEvents(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black26,
        fixedColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
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
