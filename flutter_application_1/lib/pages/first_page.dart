import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/history_page.dart';
import 'package:flutter_application_1/pages/home_page.dart'; 
import 'package:flutter_application_1/pages/profile_page.dart'; 
import 'package:flutter_application_1/pages/settings_page.dart'; 
import 'package:flutter_application_1/pages/history_page.dart'; 

/*
this 
page
handles
all
my
routing
and
app bars n stuff
mainly the bottom navigation bar. 
*/

class FirstPage extends StatefulWidget {
   FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  //keeps track of current page to display
  int _selectIndex = 1;

  final List _pages = [
    //history page
    HistoryPage(),

    //home page
    HomePage(),

    //profile page
    ProfilePage(),
  ];

  void _navigateBotomBar(int index){
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      // appBar: AppBar(title: const Text("first page")),
      
      // drawer: Drawer(
        
      //   backgroundColor: Colors.deepPurple[400],
      //   child:  Column(
      //     children: [
      //       DrawerHeader(
      //         child: Icon(
      //           Icons.fitbit,
      //           color: Colors.white,
      //           size: 48,
      //         ),
      //       ),

      //       //home page list tile
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text("H O M E"),
      //         textColor: Colors.white,
      //         onTap: () {
      //           //go to home page
      //           Navigator.pop(context);// ges rid of drawer before going to the 
      //           //next page so when you go back its not the first thing you see
      //           Navigator.pushNamed(context, '/homepage');
      //         },
      //       ),
            
      //       // first page list tile
      //       ListTile(
      //         leading: Icon(Icons.numbers),
      //         title: Text("P A G E 1"),
      //         textColor: Colors.white,
      //         onTap: () {
      //           //go to first page
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/firstpage');
      //         },
      //       ),
            
      //       //second page page list tile      
      //       ListTile(
      //         leading: Icon(Icons.numbers),
      //         title: Text("P A G E 2"),
      //         textColor: Colors.white,
      //         onTap: () {
      //           //go to second page
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/secondpage');
      //         },
      //       ),

      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text("S E T T I N G S"),
      //         textColor: Colors.white,
      //         onTap: () {
      //           //go to settings page
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/settingspage');
      //         },
      //       ),


      //     ],
      //   ),
      // ),
      
      body: _pages[_selectIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: _navigateBotomBar,
        items: const [

          //History
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'History',
           ),

          //home page
          BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded),
            label: 'Workout',
           ),

          //profile page
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
           )
        ],
      ),
      
      
      );
  }
}