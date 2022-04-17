import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rentverse1/misc/colors.dart';
import 'package:rentverse1/widgets/navigation_widget_landlords.dart';

class HomeScreenLandlords extends StatefulWidget {
  HomeScreenLandlords({Key? key}) : super(key: key);

  @override
  State<HomeScreenLandlords> createState() => _HomeScreenLandlordsState();
}

class _HomeScreenLandlordsState extends State<HomeScreenLandlords> {
  int currentIndex = 1;
  final screens = [
    //pwede page
    Container(
      child: Center(
        child: Text("HOME"),
      ),
    ),
    Container(
      child: Center(
        child: Text("asd"),
      ),
    ),
    Container(
      child: Center(
        child: Text("HOMqqE"),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidgetLandlords(),
      appBar: AppBar(
        backgroundColor: colorScheme.purpleMuch,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          selectedLabelStyle: TextStyle(
              fontSize: 13, fontFamily: 'Poppins', fontWeight: FontWeight.w100),
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: "Summary",
              backgroundColor: colorScheme.purpleMuch,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Boarding houses",
              backgroundColor: colorScheme.purpleMuch,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_suggest),
              label: "Manage units",
              backgroundColor: colorScheme.purpleMuch,
            )
          ]),
    );
  }
}
