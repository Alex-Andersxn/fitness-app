import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/first_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/second_page.dart';
import 'package:flutter_application_1/pages/settings_page.dart';
import 'package:flutter_application_1/pages/history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: FirstPage(),
      routes: {
        '/firstpage' :(context) =>  FirstPage(),
        '/secondpage' :(context) =>  SecondPage(),
        '/settingspage' : (context) => SettingsPage(),
        '/homepage':(context) => HomePage(),
        '/profilepage':(context) => ProfilePage(),
        '/history':(context) => HistoryPage(),
      },
      );
      
  }
} 
      // Scaffold()
  //       appBar: AppBar(
  //       backgroundColor: Colors.blue[100],
  //         title: const Text("fitness tracker", style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 28,
  //           fontWeight: FontWeight.bold),
  //           ),   
  //         // backgroundColor: Colors.blue,
  //         elevation: 100,
  //         leading: Icon(Icons.menu, color: Colors.white, size: 30),
  //         actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout, color: Colors.white, size: 30),)]
  //       ),
        
  //       body: Center(
          
  //         child: Container(
  //         height: 300,
  //         width: 300,
  //         decoration: BoxDecoration (
  //                   color: Colors.blue,
  //                   borderRadius: BorderRadius.circular(20
  //                   )
  //         ),
  //         padding: const EdgeInsets.all(20),
  //         //  child: const Text(
  //         //   "Start workout",
  //         //   style: TextStyle(
  //         //   color: Colors.white,
  //         //   fontSize: 28,
  //         //   fontWeight: FontWeight.bold),
  //         //   ),
  //         child: const Icon(
  //           Icons. add_circle_outline_rounded,
  //           color: Colors.white,
  //           size: 64,
  //         ),
  //       )
      
  //     ),
  //     ),
  //   );
  // }
