import 'package:flutter/material.dart';
import 'package:project_fomo/components/navigation/discover.dart';
import 'package:project_fomo/components/navigation/my_events.dart';
import 'package:project_fomo/components/navigation/profile.dart';
import 'package:project_fomo/components/navigation/search.dart';
import 'package:project_fomo/components/shared/gradient_icon.dart';
import 'package:project_fomo/style.dart';

class RootPage extends StatefulWidget {
  static const String pageRoute = '/root';

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  List<Widget> subNavigators = [
    Discover(),
    Search(),
    MyEvents(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: subNavigators,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColor.dp3,
        selectedItemColor: Colors.red,
        unselectedItemColor: AppTextColor.disabled,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          if (_selectedIndex != index) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text('Discover'),
            activeIcon: GradientIcon(
              icon: Icons.home,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            title: Text('Search'),
            activeIcon: GradientIcon(
              icon: Icons.search,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event_note,
              size: 30,
            ),
            title: Text('Events'),
            activeIcon: GradientIcon(
              icon: Icons.event_note,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
            title: Text('Profile'),
            activeIcon: GradientIcon(
              icon: Icons.person_outline,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
