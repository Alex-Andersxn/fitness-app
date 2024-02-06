import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'history_page.dart';

class NavPage extends StatefulWidget {
  final DatabaseHelper databaseHelper;

  const NavPage({Key? key, required this.databaseHelper}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  // keeps track of the current page to display
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    // history page
    HistoryPage(),

    // home page
    HomePage(),

    // profile page
    ProfilePage(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: const [
          // History
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'History',
          ),
          // Home page
          BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded),
            label: 'Workout',
          ),
          // Profile page
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.deepPurple[100],
      ),
    );
  }
}
